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
	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/crm/customer.js"></script>
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
	margin-right: 2%;
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
.modal-dialog {
    width: auto;
    margin: 30px auto;
}
.modal-dialog
{
 margin-top: 14.5%;
 }
 .searchbutton{
background-image: url(../images/search.png);
    background-position: right;
    text-align: left;
    height: 30PX;
    background-repeat: no-repeat;
    margin-bottom: 2px;
    background-origin: content-box;
    width: 41px;
    padding: 4px 10px;
    border-left: 1px solid #ccc;
    /* background: #3c8dbc; */
    z-index: 999;
    position: absolute;
    background-color: #3c8dbc;
        right: 0;
    top: 0;
}

body.modal-open {
/* margin-left: auto;
margin-right: auto; */
padding-right: 0px !important;
}

</style>
<script type="text/javascript">
$(document).ready(function(){
	print_country("country");
	/* $("#country").val("India");
	print_state('states',104); */
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
		 <%-- <div class="box-header" style="text-align: center">
		   <h3><spring:message code="customer.view.label" /></h3>
		 </div> --%><!-- /.box-header -->
    <!-- form start -->
    <form id="customersInfo" method="post">
        <div class="box-body">
        <br>
        <div id="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
          <div id="success" style="text-align: center;color: blue;font-size: 2;font-weight: bold;">${success}</div>
      
       <div class=" " style="margin-left: 10px;">
        <div class=" form-group col-lg-11" style=" background: #f4f4f4;  width: 86%;padding-left: 15px;padding-right: 15px;">
       	<div class="row" style="">
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
                	  	<option value="-- Select --" >ALL</option>
                	  	<option value="PREMIUM" >PREMIUM</option>
                	  	<option value="PLUS" >PLUS</option>
                	  	<option value="BASIC" >BASIC</option>
                	  	<option value="GENERIC" >GENERIC</option>
                	  	<option value="NORMAL" >NORMAL</option>
                	  	 <option value="SILVER">SILVER</option>
						<option value="GOLD" >GOLD</option>
					    <option value="PLATINUM">PLATINUM</option>
					    <option value="EMPLOYEE PREMIUM">EMPLOYEE PREMIUM</option>
					    <option value="EMPLOYEE GENERIC">EMPLOYEE GENERIC</option>
					  </select>
        	 	</div>
        	 
        	 	<div class="form-group col-lg-4">
        	 		<label><spring:message code="zone.label"/></label>
                	   <select class="form-control" id="outletZone" onchange="searchlocationsBasedOnZoneForDashboard('outletZone','location','')">
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
        	 	<div class="form-group col-lg-4" style="padding-right: 0px;">
        	 	<div class="form-group col-lg-6" style="padding-left: 0px;">
        	 	
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
					  
					  <div class="form-group col-lg-6" style="padding-left: 0px;">
        	 		<label><spring:message code="gender.label" /></label>
                	  <select id="gender" name ="gender" class="form-control clearError" >
						<option value="-- Select --" >ALL</option>
						<option value="Male" >Male</option>
						<option value="Female" >Female</option>
					  </select>
        	 	</div>
					  
					  
        	 	</div>
        	 	
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
	                   	 </select>
	                </div>
        	 </div>
        	 <div class="row">
        	 	<div class="form-group col-lg-4">
        	 		 <label><spring:message code="city.label" /></label>
        	 		 <input type="text" id="city" class="form-control clearError city-class">
						<!--  <select id ="city" class="form-control" >
							<option >Select State</option>
						</select> -->
        	 	</div>
        	 	
        	 	
        	 	<div class="form-group col-lg-8 col-md-8">
							<div class="col-lg-6 col-md-6" style="padding-left: 0px;">
								  <label><spring:message code="customer.group.label"/></label>
	                      <select class="form-control" id="customerGroup" style="padding: 3px 4px;" >
	               		          <option value=""><spring:message code="ALL.label"/></option>
	               					<c:forEach var="group" items="${groupsList}">
	               		           	<option value="${group.group_id}" ${group.group_id == group_id ? 'selected' : ''}>${group.group_id}</option>
	 					         </c:forEach>
	               		         
	                   	 </select>
							</div>
							<div class="col-lg-6 col-md-6" style="padding: 0px;">
								                  <a onclick="" style="padding: 4px 8px;     margin-bottom: 15px;   width: 100%;margin-top: 18px;background-color: #999 !important;" class="btn bg-olive btn-inline">Upload customer group..</a>

							</div>


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
                	<input class="form-control calendar_icon clearError" readonly="readonly" style="background-color: white;" id="fromDate" onfocus="callCalender('fromDate')" onclick="callCalender('fromDate')" placeholder="DD/MM/YYYY"/>
        	 	</div>
        	 </div>
             <div class="row">
        	 	<div class="form-group col-lg-7">
        	 		 <label><spring:message code="product.label" /></label>
        	 		 <input type="text"  class="form-control searchItems clearError searchBar" id="searchItems" placeholder="<spring:message code="search.product.label" />"style="" />
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
                	<input class="form-control calendar_icon clearError" readonly="readonly" style="background-color: white;" id="endDate" onfocus="callCalender('endDate')" onclick="callCalender('endDate')" placeholder="DD/MM/YYYY"/>
        	 	</div>
        	 	<input type="hidden" value="false" id="saveflag"/>
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
          <div class="form-group col-lg-1" style="padding-left: 15px;padding-right: 15px; width: 13%;  padding: 48px 15px;    background: #ccc;">
             <div class="col-lg-12" style="    border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
                <div class="row">
                  <a onclick="getCustomers('0');" style="padding: 4px 8px;     margin-bottom: 15px;   width: 100%;margin-top: 16px;" class="btn bg-olive btn-inline"><spring:message code="searchbutton.label"/></a>
                </div>
               <div class="row">
                 <a onclick="reset1Form();" style="padding: 4px 8px;     margin-bottom: 15px;   width: 100%;margin-top: 16px;" class="btn bg-olive btn-inline"><spring:message code="clearbutton.label"/></a>
                </div>
             </div>
            </div>
         </div>         
        
                <!-- COMPOSE MESSAGE MODAL -->
         <div class="modal fade popup-display" id="notification-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" style="width:80%">
                <div class="modal-content" style="margin-top: 15%;background: rgb(249,249,249);">
                    <div class="modal-header" >
                        <button type="button" style="margin-top: -7px;" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <div class="row">
	                        <div class="col-lg-2">
		                        <h4 class="modal-title" style=""><label><spring:message code="customer.notification" /></label></h4>
	                        </div>
	                        <div class="col-lg-8" id="notificationError" style="text-align: center;color: red;font-size: 2;font-weight: bold;"></div>
                        </div>
                    </div>
             <form action="#" method="post">
                 <div class="modal-body">
                 <div class="row" style="margin-top: -11px;">
                      <div class="col-lg-1"></div>
                      <div class="col-lg-8" style="padding-right: 0px;">
                      	<div style="margin: 0px;border: 1px solid #CCC;background:#D8D8D8;font-size: 16px;height: 100px;padding-top: 10px;padding-left: 15px;">You can configure either MAIL or SMS and send it to specific set of customers you already filtered. How ever, keep in mind the limitation of no of chars while configuring SMS.</div>
                      </div>
                      <div class="col-lg-2" style="">
                      	<div style="margin: 0px;border: 1px solid #CCC;background:#D8D8D8;font-size: 16px;height: 100px;padding-top: 10px;padding-left: 15px;">
	                      	<input type="radio" onchange="displayMessageBox('email');" id="email" checked="checked" value="email" name="emailOrSms">&nbsp;<spring:message code="customer.mail.id.label" /><br>
	                      	<input type="radio" onchange="displayMessageBox('sms');" name="emailOrSms" value="sms" id="sms">&nbsp;<spring:message code="customer.notification.sms.label" /> <br>
	                      	<input type="radio" onchange="displayMessageBox('customerApp');" name="emailOrSms" value="customerApp" id="customerApp">&nbsp;<spring:message code="customer.app.label" />
                      
                      	</div>
                      </div>
                      <div class="col-lg-1"></div>
                 </div>
                 <br>
                  <div class="row" id="subjectDiv">
                      <div class="col-lg-1"></div>
<%--                       <div class="col-lg-1"><spring:message code="customer.view.subject.label" /></div> --%>
                      <div class="col-lg-10" style="margin-bottom: 5px;">
                      <label><spring:message code="customer.view.subject.label" /></label>
                      		<input class="form-control" type="text" id="notificationSubject">
                      </div>
                      <div class="col-lg-1"></div>
                 </div>
                 <div class="row" style="text-align: center">
                 	<div class="col-lg-1"></div>
                 	<div class="form-group col-lg-10">
						<textarea class="form-control" rows="6" style="resize:none;" id="notificationMsg"></textarea>
                 	</div>
                 	<div class="col-lg-1"></div>
                 </div>
                 <div class="row" style="text-align: center">
                 	<div class="buttons" style="margin-bottom: 7px;">
		           		 <a onclick="sendNotification();" class="btnCls ">&nbsp;&nbsp;&nbsp;<spring:message code="submit.label" />&nbsp;&nbsp;&nbsp;</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		           		 <a onclick="closePopup();" class="btnCls buttonMargin">&nbsp;&nbsp;<spring:message code="cancel.label" />&nbsp;&nbsp;</a>
		             </div>
                 </div>
              </div>
             </form> 
         </div><!-- /.modal-content -->
     </div><!-- /.modal-dialog -->
 </div><!-- /.modal -->
 <br> <br>
         <%-- <div class="row" style="text-align: center;">
			  <div class="buttons" style="margin-bottom: 7px;">
           		 <a onclick="getCustomers('0');" class="button"><font size="2px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="go.label" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		 <a onclick="reset1Form();" class="button"><font size="2px">&nbsp;&nbsp;<spring:message code="reset.label" />&nbsp;&nbsp;</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		 <a onclick="displayNotificationPopup();" class="button"><font size="2px">&nbsp;&nbsp;<spring:message code="send.notification.label" />&nbsp;&nbsp;</font></a>
              </div>
           </div> --%>
           <div id="notification">
           </div>
          <div id="customerTable">
          	<%@ include file="customerDetails.jsp" %>
          </div>
      </div>
         <div class="box-footer"></div>
     </form>
 </div>
</div>
</div>
<script src="${pageContext.request.contextPath}/js/googleMap.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDHNN78JQSuDoLAZigF4cTbHgyeduFpVn8&libraries=places&callback=initAutocomplete"
         async defer></script>
         <input class="street-class" type="hidden" id="street_name">
         <input class="locality-class" type="hidden" id="landmark_name">
         <input class="city-class" type="hidden" id="city_name">
         <input class="state-class" type="hidden" id="state_name">
         <input class="zip-code-class" type="hidden" id="zip_code">
         <input class="country-class" type="hidden" id="country_name">
         <input class="latitude-class" type="hidden" id="latitude">
         <input class="longitude-class" type="hidden" id="longitude">
<div id="mapid" style="    display: none;"></div>
</section><!-- /.content -->
</body>
</html>