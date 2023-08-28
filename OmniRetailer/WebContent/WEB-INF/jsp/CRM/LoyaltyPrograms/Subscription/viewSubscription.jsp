   <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Omni Retailer</title>

<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
 	<script type= "text/javascript" src = "${pageContext.request.contextPath}/js/countries.js"></script>
 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	
	 <script type="text/javascript" src="${pageContext.request.contextPath}/js/crm/loyaltyPrograms/subscription.js"></script>



<script type="text/javascript">
 $(document).ready(function(){
	/* callCalender('startDate');
	callCalender('expiryDate');
	////print_country("country");
	 var date = getCurrentDate();
	 $("#country").val("India"); */
		/* var selectedLocations = $("#selectedLocation").val().replace('[','').replace(']','').replace(/, /g,',');
		$("#location").val(selectedLocations.split(',')); */
 }); 
 
 $("#subscriptionName").keydown(function(){
	   $("#errsubscriptionName").html("");
	   $("#Error").html("");
});

var subscriptionCode = $("#subscriptionCode").val();
$("#subscriptionCode").keydown(function(){
	
	   $("#subscriptionCode").html("");
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
<style type="text/css">
.table-striped>tbody>tr:nth-of-type(odd) {
        background-color: #f9f9f9;
        text-align: center;
}
</style>
</head>

<body>

<section class="content">
<div class="row">
  <div class="col-xs-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center">
                            <h3><spring:message code="subscription.view.label" /></h3> 
                                </div>
                               
                                <form id="subscription" method="GET" >
                                    <div class="box-body">
                                   	<div id="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
                                    <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;">${success}</div>
                                    	
                                    <div class="row" style="background: #efefef;width: 100%;margin-left: 0px !important;" >	

                                    <div class="row">
                               		<div class="form-group col-lg-2">
                               		<div class="col-lg-12">                               		
                                        <label>Subscription ID<span style="color:red; font-size:2">*</span>  </label>
                                        <input type="text" class="form-control" id="subscriptionCode"  name="couponProgramCode1" value="${subscriptionObj.subscriptionId}" readonly/>
                                          <span style="color:red; font-size:2;white-space: nowrap;" id="errsubscriptionCode"></span>
                                 	</div>
                                 	</div>
                                 	
                                	<div class="form-group col-lg-2" style=" ">
                                    <label><spring:message code="startdate.label" /> <span style="color:red; font-size:2">*</span></label>
                                     <div class="input-group">
                                    	<div class="input-group-addon">
                                        	<i class="fa fa-calendar"></i>
                                    	</div>
                                    	
                                    	<input class="form-control" disabled="disabled" style="background-color: white;" name="startDateStr" id="startDate" size="20" type="text" value="${subscriptionObj.startDateStr}" onfocus="callCalender('startDate')" onclick="callCalender('startDate')" placeholder="DD/MM/YYYY" />
                                        	<!-- <input type="text" name="createdOn" id="createdOn" required class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/> -->
                                   		 </div> <!-- /.input group -->
                                   		 <span style="color:red; font-size:2" id="startDateError"></span>
                                    	</div>
                                    	
										<div class="form-group col-lg-2" style=" ">
                                        <label>  <spring:message code="subscription.type.label" /></label>
                                         <select class="form-control" name="subscriptionType"  id="subscriptionType" disabled="disabled">
                                            <option value="Daily" ${'Daily' == subscriptionObj.period ? 'selected' : ''} > Daily</option>
	                                        <option value="AlternateDay" ${'AlternateDay' == subscriptionObj.period? 'selected' : ''}>AlternateDay</option>
	                                         <option value="Weekly" ${'Weekly' == subscriptionObj.period ? 'selected' : ''}>Weekly</option>
                                         <option value="Monthly" ${'Monthly' == subscriptionObj.period ? 'selected' : ''}>Monthly</option>
                                        </select>
									</div>
									
                                     	<div class="form-group col-lg-2" style=" ">
                                   		<div class="col-lg-12">
                                            <label><spring:message code="subscription.price.label" /></label>
                                            <input type="text" class="form-control" id="rewardPrice"  name="rewardPrice" value="${subscriptionObj.rewardPrice}" readonly/>
                                              <span style="color:red; font-size:2;white-space: nowrap;" id="rewardPriceError"></span>
                                     	</div>
                                     	</div>  
                                     	
                                     	<div class="form-group col-lg-2" >
                                    	<div class="col-lg-12 ">
                                            <label>No.Of Subscriptions<span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="quantityNO"  disabled="disabled" name="quantity" value="${giftCoupon.quantity}"/>
                                             <span style="color:red; font-size:2;font-weight: bold" id="errQuantity"></span>
                                         </div>
                                     </div>
                                   	</div>
                                   	
                                   	 	
                                    <div class="row"  >
                                    		<div class="form-group col-lg-2">
                                    		<div class="col-lg-12 ">
                                            <label><spring:message code="subscription.name.label"/> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="subscriptionName" name="subscriptionName" value="${subscriptionObj.subscriptionName}" readonly/>
                                             <span style="color:red; font-size:2" id="errsubscriptionName"></span>
                                             </div>
                                     		</div> 
                                   	
                                   	<div class="form-group col-lg-2" style="" >
                                            <label><spring:message code="end.date.label" /> <span style="color:red; font-size:2">*</span></label>
                                             <div class="input-group">
                                            	<div class="input-group-addon">
                                                	<i class="fa fa-calendar"></i>
                                            	</div>
                                            	<input class="form-control" disabled="disabled" style="background-color: white;" name="expiryDateStr" id="endDate" size="20" type="text" value="${subscriptionObj.endDateStr}" onfocus="callCalender('endDate')" onclick="callCalender('endDate')" placeholder="DD/MM/YYYY"/>
                                       		 </div><!-- /.input group -->
                                       		  <span style="color:red; font-size:2" id="endDateError"></span>
                                         </div>
                                   	
                                    	<div class="form-group col-lg-2" style="">
                                            <label><spring:message code="status.label" /><!--  <span style="color:red; font-size:2">*</span> --></label>
                                             <select class="form-control" name="status" id="status" disabled="disabled">
	                                           <option value="" ${'' == subscriptionObj.status ? 'selected' : ''}><spring:message code="ALL.label"/></option>
						     	<option value="Subscribed" ${'Subscribed' == subscriptionObj.status ? 'selected' : ''}>Subscribed</option>
                                <option value="Unubscribed" ${'Unubscribed' == subscriptionObj.status ? 'selected' : ''}>Unubscribed</option>
                                 <option value="Paused" ${'Paused' == subscriptionObj.status ? 'selected' : ''}>Paused</option>
                                      
						     	
						 	 </select>
										</div> 
                                    	
								<div class="form-group col-lg-2" style=" ">
                                   		<div class="col-lg-12">
                                            <label>reward Type</label>
                                            <input type="text" class="form-control" id="renewalPrice"  name="renewalsubPrice" value="${subscriptionObj.rewardPrice}" readonly/>
                                              <span style="color:red; font-size:2;white-space: nowrap;" id="renewalsubPriceError"></span>
                                     	</div>
                                     	</div>
                                     		<div class="form-group col-lg-2" >
                                    	<div class="col-lg-12 ">
                                            <label>Previous Ordered date</label>
                                            <input type="text" class="form-control" id="previousordereddate"  name="previousordereddate" value="${subscriptionObj.previousOrderDateStr}" readonly="readonly"/>
                                     	</div>
                                     	</div>
                                    </div>
                                    </div>
                                    <div class="row">
                                    	<div class="col-lg-12" style=" margin-left: 0px;margin-top: 1.8%;">
		               <%-- <div class="col-lg-12" style="margin-left:-15px; width:100%;">
							<input type="text"  class="form-control" value="${searchName}" id="searchRoute" placeholder="Search here..." />
                            <button id="mySearch" class="searchbutton"></button>
							<input type="hidden" id="searchName" value="${searchName}">
							<span id="supplierNameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
	        	 	  </div> --%>
										<div class="table-responsive" role="grid" style="overflow-x: auto; width: 100%; position: relative; white-space: nowrap;"id="subpItmesList">
											<table id="cardssubDetails"	class="table table-striped table-bordered">
												<thead	style="background-color: #eeee !important; border-left: hidden; border-right: hidden;">
								             <tr>
														<th class="col-sm-1"><spring:message code="slno.label" /></th>
															<th>Sku ID</th>
															<th style="text-align: left;">Item Name</th>
															<th>PluCode</th>
															<th >Quantity</th>
															<th >MRP</th>
															<th class="col-sm-1"><spring:message code="status.label"/></th>
				                             </tr> 
											</thead>
												<tbody>
												<c:forEach var="subscriptionObjlist" items="${subscriptionObj.subscriptionProductsList}" varStatus="theCount">
                                            <tr>
                                                <td>${theCount.count}</td>
                                                <td>${subscriptionObjlist.skuId}</td>
                                                <td style="text-align: left;">${subscriptionObjlist.itemName}</td>
                                                <td>${subscriptionObjlist.pluCode}</td>
                                                <td>${subscriptionObjlist.quantity}</td>
                                                <td>${subscriptionObjlist.mrp}</td>
                                                <td>${subscriptionObjlist.status}</td>
                							</tr>
                                            </c:forEach> 
                                           
												</tbody>
											</table>	
										</div>
                                   
									  </div>
                                    </div><!-- /.box-body -->
									
						<div class="row" style="text-align: center;">
					 <c:if test="${sessionScope.role == 'super admin'}"> 
					 	<input type="button" class="btnCls buttonMargin" style="margin-left: 0%;margin-top: 1%;" onclick="viewSubscriptions('subscriptions','subscription','0','menu');" value="<spring:message code="cancel.label" />" />
					 </c:if>
					<c:forEach var="accessControl" items="${sessionScope.CustomerLoyality}">
                         <c:if test="${accessControl.appDocument == 'Wallets' && accessControl.write == true && accessControl.read == true}">
						<input type="button" class="btnCls buttonMargin" style="margin-left: 0%;margin-top: 1%;" onclick="viewSubscriptions('subscriptions','subscription','0','menu');" value="<spring:message code="cancel.label" />" />
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