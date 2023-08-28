<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Vasudeva Reddy.G
 * file name		        : CRM/LoyaltyPrograms/Memberships/newMembership.jsp
 * file type		        : JSP
 * description				: The new membership page is displayed using this jsp.
 * */ -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
 	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/countries.js"></script>
 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/crm/loyaltyPrograms/memberships.js"></script>
 
 <script type="text/javascript">
 $(document).ready(function(){
	/* callCalender('startDate');
	callCalender('endDate');
	 print_country("country"); 
	 var date = getCurrentDate();
	 $("#country").val("India");

	multipleCheckValidation();
		 $("#state").html(op);
			
				  var slectedLocations = $("#selectedLocation").val().replace('[','').replace(']','').replace(/, /g,',');
				$("#location").val(slectedLocations.split(','));   */
			
}); 
$("#subscriptionName").keydown(function(){
	   $("#errsubscriptionName").html("");
	   $("#Error").html("");
});

var subscriptionCode = $("#subscriptionCode").val();
$("#subscriptionCode").keydown(function(){
	 /* if(promoCode.length<5){
			$("#errpromoCode").html("Enter atleast 5 Characters/Numbers");
			return;
		}
	else{  */
	   $("#errsubscriptionCode").html("");
	   $("#Error").html("");

});
 
$("#startDate").keydown(function(){
	   $("#startDateError").html("");
	   $("#Error").html("");
});

$("#endDate").keydown(function(){
	   $("#errendDate").html("");
	   $("#Error").html("");
}); 

</script>  
</head>
<body>

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-xs-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center">
                                <br/>
                                <h3 style="width: 25%; margin: auto;border: 1px solid black"><spring:message code="subscription.creation.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form id="subscription" method="POST" >
                                    <div class="box-body">
                                   	<div id="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
                                    <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;">${success}</div>
                                    	
                                  <div class="row" style="background: #efefef;width: 100%;margin-left: 0px !important;" >
                                    	<div class="row" style="margin-top: 10px;">
                                   		<div class="form-group col-lg-2">
                                   		<div class="col-lg-12">
                                            <label><spring:message code="subscription.code.label" /><span style="color:red; font-size:2">*</span>  </label>
                                            <input type="text" class="form-control" id="subscriptionCode"  name="couponProgramCode" value="${giftCoupon.couponProgramCode}"/>
                                              <span style="color:red; font-size:2;white-space: nowrap;;font-weight: bold" id="errsubscriptionCode"></span>
                                     	</div>
                                     	</div>
                                   		
									 	<div class="form-group col-lg-2" style=" ">
                                            <label><spring:message code="start.date.label" /> <span style="color:red; font-size:2">*</span></label>
                                             <div class="input-group">
                                            	<div class="input-group-addon">
                                                	<i class="fa fa-calendar"></i>
                                            	</div>
                                            	<input class="form-control"  style="background-color: white;" name="startDateStr" readonly="readonly" id="startDate" size="20" type="text" value="${subscription.startDate}" onfocus="callCalender('startDate')" onclick="callCalender('startDate')" placeholder="DD/MM/YYYY"/>
                                            	<!-- <input type="text" name="createdOn" id="createdOn" required class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
                                       		 </div> <!-- /.input group -->
                                       		 <span style="color:red; font-size:2;font-weight: bold" id="startDateError"></span>
                                        	</div> 
									  
										 <div class="form-group col-lg-2" style="">
                                            <label  >  <spring:message code="subscription.type.label" /></label>
                                             <select class="form-control" name="subscriptionType"  id="subscriptionType">
	                                            <option value="SILVER" >SUBSCRIPTION SILVER</option>
    	                                        <option value="GOLD" >SUBSCRIPTION GOLD</option>
    	                                         <option value="PLATINUM" >SUBSCRIPTION PLATINUM</option>
                                            </select>
										</div> 
										
										<div class="form-group col-lg-2" style=" ">
                                   		
                                            <label><spring:message code="subscription.price.label" /></label>
                                            <input type="text" class="form-control" id="rewardPrice"  name="rewardPrice" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" value="${giftCoupon.couponProgramCode}"/>
                                              <span style="color:red; font-size:2;white-space: nowrap;" id="rewardPriceError"></span>
                                    	</div>
                                    	
                                    	 <div class="form-group col-lg-2" >
                                    	<div class="col-lg-12 ">
                                            <label>No.Of Subscriptions<span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="quantityNO" name="quantity" value="${giftCoupon.quantity}"/>
                                             <span style="color:red; font-size:2;font-weight: bold" id="errQuantity"></span>
                                         </div>
                                     </div>
                                    </div>
                                    	
                                    <div class="row"  >
                                    		<div class="form-group col-lg-2" >
                                    		<div class="col-lg-12 ">
                                            <label><spring:message code="subscription.name.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="subscriptionName" name=subscriptionName value="${giftCoupon.promoName}"/>
                                             <span style="color:red; font-size:2;font-weight: bold" id="errsubscriptionName"></span>
                                             </div>
                                     		</div> 
                                    	 <div class="form-group col-lg-2" style=" ">
                                            <label><spring:message code="end.date.label" /> <span style="color:red; font-size:2">*</span></label>
                                             <div class="input-group">
                                            	<div class="input-group-addon">
                                                	<i class="fa fa-calendar"></i>
                                            	</div>
                                            	<input class="form-control" style="background-color: white;" name="endDateStr" readonly="readonly" id="endDate" size="20" type="text" value="${giftCoupon.endDateStr}" onfocus="callCalender('endDate')" onclick="callCalender('endDate')" placeholder="DD/MM/YYYY"/>
                                            	<!-- <input type="text" name="endDate" id="endDate" required class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
                                       		 </div><!-- /.input group -->
                                       		  <span style="color:red; font-size:2;font-weight: bold" id="endDateError"></span>
                                         </div> 
                                   
                                   <div class="form-group col-lg-2" style=" ">
                                            <label><spring:message code="status.label" /><!--  <span style="color:red; font-size:2">*</span> --></label>
                                             <select class="form-control" name="status" id="status">
	                                            <option value="Active" ${'Active' == giftCoupon.status ? 'selected' : ''}>Active</option>
    	                                        <option value="Suspend" ${'Suspend' == giftCoupon.status ? 'selected' : ''}>Suspend</option>
                                            </select>
										</div> 
										
                                     
                                     	<div class="form-group col-lg-2" >
                                    	<div class="col-lg-12 ">
                                            <label>Reward Type</label>
                                            <input type="text" class="form-control" id="rewardType"  name="rewardType" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" value="${giftCoupon.couponProgramCode}"/>
                                              <span style="color:red; font-size:2;white-space: nowrap;" id="rewardTypeError"></span>
                                     	</div>
                                     	</div>
                                        </div>
                                       </div>
    
    <div class="row">
	 <div class="col-lg-12" style="margin-left:0px; margin-right:20px;width:99%;">
   
							<input type="text"  class="form-control" value="${searchName}" id="searchRoute" placeholder="Search here..." />
                            <button id="mySearch" class="searchbutton"></button>
							<input type="hidden" id="searchName" value="${searchName}">
							<%-- <input type="hidden" id="zone" value="${searchName}">
							<input type="hidden" id="locality" > --%>
							
							<span id="supplierNameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
   
	        	 		</div>
	
	
	

	  <div class="col-lg-12">
  	<table class="table table-striped table-bordered" style="padding-right: 0px;margin-top:5px;"id="subpItmesLIst" >
                                    	<thead style="background-color: #eeee !important; border-left: hidden;border-right: hidden;" >
                                    	<tr>
				                        	<th class="col-sm-1" ><spring:message code="slno.label"/></th>
				                        	<%-- <th class="col-sm-3" style="text-align: left"><spring:message code="subscription.id.label"/></th> --%>
				                            <th class="col-sm-3" style="text-align: left">Sku ID</th>
				                            <th class="col-sm-3" style="text-align: left">Quantity</th>
				                        	<th class="col-sm-1">PluCode</th>
				                        	<th class="col-sm-1">Item Name</th>
				                        	<th class="col-sm-1"><spring:message code="status.label"/></th>
				                        	<th class="col-sm-1"><spring:message code="action.label"/></th>
				                           </tr>      	
				                             </thead>
				                             <tbody>
                                             <c:forEach var="subpItmesLIst" items="${skuList}" varStatus="totalskus"> 
				                              <tr  class="collapse rowone${totalskus.count}">
                                             <td style="" align="center" ></td>
                                            	 
                                            	  <td id="SkuID"></td>
                                            	   <td id="quantity"></td>
                                            	   <td id="PluCode"></td>
                                            	    <td id="itemName"></td>
                                            	        <td id="status"></td>
                                            	         <td id="action"></td>
                                            	  </tr>
                                               </c:forEach> 
				                             
				                             </tbody>
                                    	</table>
									  </div> 
									  	</div>
									  
                                     
                                    </div>
                                    <!-- /.box-body -->
									
						<div class="row" style="text-align: center;">
						 <input type="button" class="btnCls" style="" onclick="createSubscription('new')" value="<spring:message code="submit.label" />" />
					 <c:if test="${sessionScope.role == 'super admin'}"> 
					 	<input type="button" class="btnCls buttonMargin" style="" onclick="viewSubscriptions('subscriptions','subscription','0','menu');" value="<spring:message code="cancel.label" />" />
					 </c:if>
					<c:forEach var="accessControl" items="${sessionScope.CustomerLoyality}">
                        <c:if test="${accessControl.appDocument == 'Wallets' && loyalitycoupons==false}">
						<input type="button" class="btnCls buttonMargin" style="" onclick="viewSubscriptions('subscriptions','subscription','0','menu');" value="<spring:message code="cancel.label" />" />
						</c:if>
					</c:forEach>
						</div>
					<br/>
                 <div class="box-footer">
                  
                 </div>
             </form>
         </div>
                            
</div>
</div>
</section>
  
</body>
</html>