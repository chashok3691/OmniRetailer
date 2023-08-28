<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/loyaltyPrograms/customerView.jsp
 * file type		        : JSP
 * description				: The new employee form is displayed using this jsp
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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/controller.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/countriesAndStates.js"></script>
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/crm/customerPurchases.js"></script>
<style type="text/css">
	
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
.buttons {
	/* float: right; */
	padding-top: 0px;
	margin-right: 0%;
	margin-top:1%;
}
a.button, .list a.button {
position:relative;
	text-decoration: none;
	color: black;
	display: inline-block;
	padding: 5px 10px 5px 10px;
	background: rgb(195,195,195);
	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
}	
.close {
    float: right;
    font-size: 20px;
    font-weight: 700;
    line-height: 1;
    color: #45372D !important;
    text-shadow: 0 1px 0 #fff;
    filter: alpha(opacity=20);
    opacity: 1 !important;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	print_country("country");
	 /* $("#country").val("India");
	 print_state('states',105);  */
	callCalender('fromDate');
	callCalender('endDate');
});
</script>
</head>
<body>
<section class="content">
<div class="row">
  <div class="col-xs-12">
	<div class="box box-primary">
    <!-- form start -->
    <form id="customersInfo" method="post">
        <div class="box-body">
        <br>
        <div id="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
      <div class=" " style="margin-left: 10px;">
      <div class=" form-group col-lg-11" style=" background: #f4f4f4;  width: 86%;padding-left: 15px;padding-right: 15px;">
       <div class="row" style="padding-left: 15px;padding-right: 15px;">
         <div class="col-lg-7">
           <div class="row">
        	 	<div class="form-group col-lg-4">
        	 		<label><spring:message code="country.label" /></label>
                	  <select onchange="print_state('states',this.selectedIndex);" id="country" name ="country" class="form-control clearError" >
						<option value="Select Country" >Select Country</option>
					  </select>
        	 	</div>
        	 	<div class="form-group col-lg-4">
        	 		<label><spring:message code="customer.type.label" /></label>
                	  <select id="customerType" name ="customerType" class="form-control clearError" >
                	  	<!-- <option value="-- Select --" >ALL</option>
                	  	<option value="PREMIUM" >PREMIUM</option>
                	  	<option value="PLUS" >PLUS</option>
                	  	<option value="BASIC" >BASIC</option>
                	  	<option value="GENERIC" >GENERIC</option>
                	  	<option value="NORMAL" >NORMAL</option> -->
                	  	<option value="">ALL</option>
		                	  	<option value="BASIC" ${customerCategory == 'BASIC' ? 'selected' : ''}>BASIC</option>
		                	  	<option value="GENERIC" ${customerCategory == 'GENERIC' ? 'selected' : ''}>GENERIC</option>
		                	  	<option value="NORMAL" ${customerCategory == 'NORMAL' ? 'selected' : ''} >NORMAL</option>
		                	  	<option value="PLUS" ${customerCategory == 'PLUS' ? 'selected' : ''}>PLUS</option>
		                	  	<option value="PREMIUM" ${customerCategory == 'PREMIUM' ? 'selected' : ''}>PREMIUM</option>
							    <option value="SILVER" ${customerCategory == "SILVER" ? 'selected' : ''}>SILVER</option>
								<option value="GOLD" ${customerCategory == "GOLD" ? 'selected' : ''}>GOLD</option>
							    <option value="PLATINUM" ${customerCategory == "PLATINUM" ? 'selected' : ''}>PLATINUM</option>
							    <option value="EMPLOYEE PREMIUM" ${customerCategory == "EMPLOYEE PREMIUM" ? 'selected' : ''}>EMPLOYEE PREMIUM</option>
							   <option value="EMPLOYEE GENERIC" ${customerCategory == "EMPLOYEE GENERIC" ? 'selected' : ''}>EMPLOYEE GENERIC</option>
							    <option value="MEMBERSHIP SILVER" ${customerCategory == "MEMBERSHIP SILVER" ? 'selected' : ''}>MEMBERSHIP SILVER</option>
							    <option value="MEMBERSHIP PLATINUM" ${customerCategory == "MEMBERSHIP PLATINUM" ? 'selected' : ''}>MEMBERSHIP PLATINUM</option>
							   <option value="MEMBERSHIP GOLD" ${customerCategory == "MEMBERSHIP GOLD" ? 'selected' : ''}>MEMBERSHIP GOLD</option>
							
					  </select>
        	 	</div>
        	 	
        	 	<div class="form-group col-lg-4">
        	 		<label><spring:message code="zone.label"/></label>
                	   <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZone('outletZone','location','')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="zoneList" items="${zoneList}">
									<option value="${zoneList.zoneID}" ${zoneList.zoneID == zone ? 'selected' : ''} id="${zoneList}" >${zoneList.zoneID}</option>
						 		</c:forEach>
	                        </select>
        	 	</div>
        	 </div>
             <div class="row">
        	 	<div class="form-group col-lg-4">
        	 		 <label><spring:message code="region.label" /></label>
						 <select id ="states" class="form-control clearError" >
						 	<option value="Select State" >Select State</option>
						</select>
        	 	</div>
        	 	<div class="form-group col-lg-3">
        	 		<label><spring:message code="age.label" /></label>
                	  <select id="age" name ="age" class="form-control clearError" >
						<option value="-- Select --" >ALL</option>
						<option value="1-12" >1 to 12</option>
						<option value="13-19" >13 to 19</option>
						<option value="20-30" >20 to 30</option>
						<option value="31-40" >31 to 40</option>
						<option value="41-50" >41 to 50</option>
						<option value="51-60" >51 to 60</option>
						<option value="61-100" >61 and above</option>
					  </select>
        	 	</div>
        	 	<div class="col-lg-1"></div>
        	 	<div class="col-lg-4 col-md-4" style="">
	                      <label><spring:message code="feedback.location.label"/></label>
	                      <select class="form-control" id="location" style="padding: 3px 4px;" >
	               		          <option value=""><spring:message code="ALL.label"/></option>
	               		         <c:forEach var="location" items="${locationsList}">
	               		         <c:choose>
							      <c:when test="${location.description == ''}">
							         <option value="${location.locationId}" ${location.locationId == storeLocation ? 'selected' : ''}>${location.locationId}</option>
							      </c:when>
							      <c:otherwise>
							      <option value="${location.locationId}" ${location.locationId == storeLocation ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							     </c:otherwise>
							     </c:choose>
<%-- 							          <option value="${location}" ${location == storeLocation ? 'selected' : ''} id="${location}" >${location}</option> --%>
	 					         </c:forEach>
<%-- 							          <option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option> --%>
	 					       
	                   	 </select>
	                </div>
        	 </div>
        	 <div class="row">
        	 	<div class="form-group col-lg-4">
        	 		 <label><spring:message code="city.label" /></label>
        	 		 <input type="text" id="city" class="form-control clearError">
						<!--  <select id ="city" class="form-control" >
							<option >Select State</option>
						</select> -->
        	 	</div>
        	 	<div class="form-group col-lg-3">
        	 		<label><spring:message code="gender.label" /></label>
                	  <select id="gender" name ="gender" class="form-control clearError" >
						<option value="-- Select --" >ALL</option>
						<option value="Male" >Male</option>
						<option value="Female" >Female</option>
					  </select>
        	 	</div>
        	 </div>
           </div>
		   <div class="form-group col-lg-5" style="border-left-color: green;border-left-width: 1px;border-left-style: solid;">
	           <div class="row">
        	 	<div class="form-group col-lg-5">
        	 		<label><spring:message code="product.category.label" /></label>
                	  <select id="productCategory" onchange="emptyProduct();" name ="productCategory" class="form-control clearError" >
                	  	<option value="-- Select --" >ALL</option>
                	  	 <c:forEach var="category" items="${categoryList}">
							<option value="${category.categoryName}">${category.categoryDescription}</option>
						 </c:forEach>
					  </select>
        	 	</div>
        	 	<div class="col-lg-2"></div>
        	 	<div class="form-group col-lg-5">
        	 		<label><spring:message code="from.date.label" /></label>
                	<input class="form-control calendar_icon clearError" readonly="readonly" value="${startDate}" style="background-color: white;" id="fromDate" onfocus="callCalender('fromDate')" onclick="callCalender('fromDate')" placeholder="DD/MM/YYYY"/>
        	 	</div>
        	 </div>
             <div class="row">
        	 	<div class="form-group col-lg-7">
        	 		 <label><spring:message code="product.label" /></label>
        	 		 <input type="text"  class="form-control searchItems clearError searchBar" id="searchItems" placeholder="<spring:message code="search.product.label" />" style="" />
						<div class="services">
			    			<div class="items">
			     				<ul class="matchedStringUl product" style=""></ul>
			   				</div>
						</div>
						<input type="hidden" id="product">
						 <!-- <select id ="product" class="form-control" >
							<option value="-- Select --" >-- Select --</option>
						</select> -->
        	 	</div>
        	 	<div class="form-group col-lg-5">
        	 		<label><spring:message code="to.date.label" /></label>
                	<input class="form-control calendar_icon clearError" readonly="readonly" value="${endDate}" style="background-color: white;" id="endDate" onfocus="callCalender('endDate')" onclick="callCalender('endDate')" placeholder="DD/MM/YYYY"/>
        	 	</div>
        	 </div>
        	 <div class="row">
        	 	<div class="form-group col-lg-7">
        	 		 <label><spring:message code="price.range.label" /></label>
        	 		 	<div class="row">
       						<div class="col-lg-6 col-md-6" style="padding-right: 5px;">
	                            <input type="text" class="form-control clearError" id="startPrice" required oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="start.price.label" />" />
       						</div>
       						<div class="col-lg-6 col-md-6" style="padding-left: 5px;">
	                            <input type="text" class="form-control clearError" id="endPrice" required oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" placeholder="<spring:message code="end.price.label" />" />
       						</div>
       					</div>
						<!--  <select id ="priceRange" class="form-control" >
							<option value="-- Select --" >-- Select --</option>
						</select> -->
        	 	</div>
        	 	<div class="form-group col-lg-5">
        	 		<label><spring:message code="purchase.channel.label" /></label>
                	  <select id="purchaseChannel" class="form-control clearError" >
                	  	 <option value="-- Select --" >ALL</option>
                	  	 <option value="Direct" >Direct</option>
                	  	 <option value="Telephone" >Telephone</option>
                	  	 <option value="Online" >Online</option>
                	  	  <option value="Mobile" >Mobile</option>
                	  	 <option value="Sales Personnel" >Sales Personnel</option>
					  </select>
        	 	</div>
        	 </div>                   
	       </div>
         </div>
         </div>
         <input type="hidden" value="false" id="saveflag"/>
         <div class="form-group col-lg-1" style="padding-left: 15px;padding-right: 15px; width: 13%;  padding: 42px 15px;    background: #ccc;">
             <div class="col-lg-12" style="    border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
                <div class="row">
                 <a onclick="getCustomerPurchases('0');" style="padding: 4px 8px;     margin-bottom: 15px;   width: 100%;margin-top: 16px;" class="btn bg-olive btn-inline"><spring:message code="searchbutton.label"/></a>
                </div>
               <div class="row">
                <a onclick="resetForm();" style="padding: 4px 8px;     margin-bottom: 15px;   width: 100%;margin-top: 16px;" class="btn bg-olive btn-inline"><spring:message code="clearbutton.label"/></a>
                </div>
             </div>
            </div>
         </div>
         
                <!-- COMPOSE MESSAGE MODAL -->
         <div class="modal fade popup-display" id="notification-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" style="text-align: center;">Notification Message</h4>
                    </div>
             <form action="#" method="post">
                 <div class="modal-body">
                 <div class="row" style="text-align: center">
                 	<div class="form-group col-lg-12">
						<textarea class="form-control" rows="4" style="resize:none;" id="notificationMsg"></textarea>
                 	</div>
                 </div>
                 <div class="row" style="text-align: center">
                 	<div class="buttons" style="margin-bottom: 7px;">
		           		 <a onclick="sendNotification();" class="button"><font size="2px">&nbsp;&nbsp;&nbsp;<spring:message code="send.label" />&nbsp;&nbsp;&nbsp;</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		           		 <a onclick="closePopup();" class="button"><font size="2px">&nbsp;&nbsp;<spring:message code="cancel.label" />&nbsp;&nbsp;</font></a>
		             </div>
                 </div>
              </div>
             </form> 
         </div><!-- /.modal-content -->
     </div><!-- /.modal-dialog -->
 </div><!-- /.modal -->
         <%-- <div class="row" style="text-align: center;">
			  <div class="buttons" style="margin-bottom: 7px;">
				 <a onclick="getCustomerPurchases('0');" class="button"><font size="2px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="go.label" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		 <a onclick="resetForm();" class="button"><font size="2px">&nbsp;&nbsp;<spring:message code="reset.label" />&nbsp;&nbsp;</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              </div>
           </div> --%>
           <div id="notification">
           </div>
          <div id="customerTable">
          	<%@ include file="customerDetailsForPurchases.jsp" %>
          </div>
      </div>
         <div class="box-footer"></div>
     </form>
 </div>
</div>
</div>
</section><!-- /.content -->
</body>
</html>