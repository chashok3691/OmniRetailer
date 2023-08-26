<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Viswanath
 * file name		        : inventorymanager/retailoutlets/procurement/viewWarehouseShipment.jsp
 * file type		        : JSP
 * description				: The viewRequestForQuotation form is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 -->

<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

	 <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/shipment.js"></script> 
	<script src="${pageContext.request.contextPath}/js/demo-compiled.js"></script>
	<style type="text/css">
  .odd{display:none!important;}
.buttons {
	float: left;
	padding-top: 0px;
	margin-right: 2%;
	margin-top:0%;
}

.form-group {
    margin-bottom: 4px;
    }
a.button, .list a.button {
position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 4px 7px 4px 7px;
	/* border-radius: 5px; */
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
	font-weight: normal; 
    background-color: rgb(128,128,128);
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
</style>
<script type="text/javascript">
 $(document).ready(function(){
	 /*  var dateTime = getCurrentDate();
	  var date = dateTime.split(' ');
	  date = date[0].split('/');
	  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
	  $('#date').val(formatedDate);
	  callCalender('date'); */
	var date = $("#date").val();
	date = date.split(' ');
	$("#date").val(date[0]);
	 var phoneNo = $("#phone").val();
		phoneNo = phoneNo.split('-');
		if(phoneNo.length == 1)
			$("#phoneNumber").val(phoneNo[0]);
		else{
			$("#defaultCountry").val(phoneNo[0]);
			$("#phoneNumber").val(phoneNo[1]);
		}
 });
 
 
 
 
 </script>
</head>
<body>
<!-- Content Header (Page header) -->

<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
	<div class="box box-primary">
         <div class="box-header" style="text-align: left;">
         <h3><spring:message code="view.shipment.label" /> : ${orderShipment.shipmentId}</h3>
         </div><!-- /.box-header -->
         <!-- form start -->
         <form role="form">
             <div class="box-body">
              <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-bottom: 20px; margin-top: -20px">${err}</div>
              <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 20px; margin-top: -20px">${success}</div>
              <input type="hidden" id="flowUnder" name="flowUnder" value= "${flowUnder}">
              <input type="hidden" id="outletLocation" name="outletLocation" value= "">
              <input type="hidden" id="status" name="status" value= "">
              <input type="hidden" id="type" value="${type}">
                 <div class="row">
					<div class="form-group col-lg-2 col-sm-2 lbl" style="text-align:right;">                   
						<label><spring:message code="shipment.from.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                     <input type="hidden" id="shipmentId" value="${orderShipment.shipmentId}">                  
	                <div class="form-group col-lg-3 col-sm-3">
	                    <select class="form-control" disabled="disabled" name="shipmentFrom"  id="shipmentFrom" onchange="">
	                    	<c:forEach var="location" items="${locationsList}">
								<option value="${location.businessActivity}" ${location.locationId == orderShipment.location ? 'selected' : ''}>${location.locationId}</option>
							</c:forEach>
						</select>
					</div>   
					<div class="col-lg-1 col-xs-1 col-sm-1"></div>  
					<div class="form-group col-lg-2 col-sm-2 lbl"  style="text-align:right;">
	                   <label><spring:message code="date.label" /> </label>
	                </div>
	                <div class="form-group col-lg-3 col-sm-3">
	                    <input type="text" class="form-control calendar_icon" value="${orderShipment.orderShippedDateStr}" readonly="readonly" id="date" />
	                    <span id="shipmentDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
	                </div>
                </div>  
                <div class="row"> 
					<div class="form-group col-lg-2 col-sm-2 lbl" style="text-align:right;">                   
						<label><spring:message code="shipped.By.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
	                <div class="form-group col-lg-3 col-sm-3">
						<input type="text" class="form-control" readonly="readonly" name="shippedBy" id="shippedBy" value="${orderShipment.shippedBy}" placeholder="<spring:message code="enter.shippedBy.label" />"/>
						<span id="shippedByError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
					</div>     
					<div class="col-lg-1 col-xs-1 col-sm-1"></div>  
					<div class="form-group col-lg-2 col-sm-2 lbl" style="text-align:right;">                   
						<label><spring:message code="transport.mode.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
	                <div class="form-group col-lg-3 col-sm-3">
	                 <select class="form-control" name="transportMode"  id="transportMode" disabled="disabled">
						 <option value="Rail" ${orderShipment.shipmentMode == 'Rail' ? 'selected' : ''}>Rail</option>
	                     <option value="Flight" ${orderShipment.shipmentMode == 'Flight' ? 'selected' : ''}>Flight</option>
	                     <option value="Express" ${orderShipment.shipmentMode == 'Express' ? 'selected' : ''}>Express</option>
	                     <option value="Ordinary" ${orderShipment.shipmentMode == 'Ordinary' ? 'selected' : ''}>Ordinary</option>
	                     <option value="Direct-Home" ${orderShipment.shipmentMode == 'Direct-Home' ? 'selected' : ''}>Direct-Home</option>
					</select>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-lg-2 col-sm-2 lbl" style="text-align:right;">                   
						<label><spring:message code="carrier.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
	                <div class="form-group col-lg-3 col-sm-3">
	                  	<input type="text" class="form-control" readonly="readonly" name="carrier" value="${orderShipment.carrier_name}" id="carrier" placeholder="<spring:message code="enter.carrier.label" />"/>
					</div> 
					<div class="col-lg-1 col-xs-1 col-sm-1"></div>  
					<div class="form-group col-lg-2 col-sm-2 lbl" style="text-align:right;">                   
						<label><spring:message code="vehicle.number.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
	                <div class="form-group col-lg-3 col-sm-3">
						<input type="text" class="form-control" readonly="readonly" name="vehicleNumber" id="vehicleNumber" value="${orderShipment.vehicleNo}" placeholder="<spring:message code="enter.vehicle.number.label" />"/>
						<span id="vehicleNumberError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
					</div>   
				</div>
				<div class="row">
					<div class="form-group col-lg-2 col-sm-2 lbl" style="text-align:right;">                   
						<label><spring:message code="inspectedBy.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
	                <div class="form-group col-lg-3 col-sm-3">
						<input type="text" class="form-control" readonly="readonly" name="inspectedBy" id="inspectedBy" value="${orderShipment.inspectedBy}" placeholder="<spring:message code="enter.inspectedBy.label" />" />
						<span id="inspectedByError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
					</div> 
					<div class="col-lg-1 col-xs-1 col-sm-1"></div> 
					<div class="form-group col-lg-2 col-sm-2 lbl" style="text-align:right;">                   
						<label><spring:message code="driver.name.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
	                <div class="form-group col-lg-3 col-sm-3">
						<input type="text" class="form-control" readonly="readonly" name="driverName" id="driverName" value="${orderShipment.driverName}" placeholder="<spring:message code="enter.driver.name.label" />"/>
						<span id="driverNameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
					</div>  
				</div>
				<div class="row">
					<div class="form-group col-lg-2 col-sm-2 lbl" style="text-align:right;">                   
						<label><spring:message code="rfidTagNo.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
	                <div class="form-group col-lg-3 col-sm-3">
						<input type="text" class="form-control" readonly="readonly" name="rfidTagNo" id="rfidTagNo" value="${orderShipment.rfidTagNo}" placeholder="<spring:message code="enter.rfidTagNo.label" />"/>
						<span id="rfidTagNoError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
					</div>
					<div class="col-lg-1 col-xs-1 col-sm-1"></div> 
					<div class="form-group col-lg-2 col-sm-2 lbl" style="text-align:right;">                   
						<label><spring:message code="contact.number.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
	                <div class="form-group col-lg-3 col-sm-3">
	                	<div class="row">
                             <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                             	<select class="form-control" style="padding: 4px 6px;" disabled="disabled" id="defaultCountry" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
                             	<option selected="selected">IN</option>
                             	<option>US</option>
                             	<option>GB</option>
                             	<option>AU</option>
                             	</select>
                             </div>
                             <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
                             	<input type="text" class="form-control" readonly="readonly" placeholder="<spring:message code="enter.customer_contact_num.label" />" id="phoneNumber" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                             </div>
                             <input type="hidden" class="form-control" name="mobile_num" id="mobile_num"  value=""/>
                              <input type="hidden" id="output" />
                        </div>
                   		<span id="error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                   		<input type="hidden" id="phone" value="${orderShipment.contactNum}">
					</div> 
				</div>
				<div class="row">
				     <div class="form-group col-lg-2 col-sm-2 lbl" style="text-align:right;">                   
						<label><spring:message code="shipment.note.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
	                <div class="form-group col-lg-3 col-sm-3">
						<input type="text" class="form-control" name="shipmentNote" readonly="readonly" id="shipmentNote" value="${orderShipment.shipmentNote}"  />
						<span id="shipmentNoteError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
					</div>  
					<div class="col-lg-1 col-xs-1 col-sm-1"></div> 
					<div class="form-group col-lg-2 col-sm-2 lbl" style="text-align:right;">                   
						<label><spring:message code="shipmentAgency.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
	                <div class="form-group col-lg-3 col-sm-3">
						<input type="text" class="form-control" name="shipmentAgency" readonly="readonly" id="shipmentAgency" value="${orderShipment.shipmentAgency}" placeholder="<spring:message code="enter.shipmentAgency.label" />"/>
						<span id="shipmentAgencyError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-lg-2 col-sm-2 lbl" style="text-align:right;">                   
						<label><spring:message code="gatePassRef.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
	                <div class="form-group col-lg-3 col-sm-3">
						<input type="text" class="form-control" name="gatePassRef" readonly="readonly" id="gatePassRef" value="${orderShipment.gatePassRef}" />
						<span id="gatePassRefError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
					</div>    
					<div class="col-lg-1 col-xs-1 col-sm-1"></div>   
					<div class="form-group col-lg-2 col-sm-2 lbl" style="text-align:right;">                   
						<label><spring:message code="shipment.status.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
	                <div class="form-group col-lg-3 col-sm-3">
	                	<select class="form-control" disabled="disabled" name="shipmentStatus" id="shipmentStatus">
                           <option value="Ready" ${orderShipment.shipmentStatus == 'Ready' ? 'selected' : ''}>Ready</option>
                           <option value="Shipped" ${orderShipment.shipmentStatus == 'Shipped' ? 'selected' : ''}>Shipped</option>
                           <option value="Delivered" ${orderShipment.shipmentStatus == 'Delivered' ? 'selected' : ''}>Delivered</option>
                           <option value="Rejected" ${orderShipment.shipmentStatus == 'Rejected' ? 'selected' : ''}>Rejected</option>
                        </select>
					</div>   
				</div>            
                <div class="row"> 
                <div class="form-group col-lg-2 col-sm-2 lbl" style="text-align:right;margin-top: 3%;">                   
					<label><spring:message code="routing.instructions.label" /> <span style="color:red; font-size:2"></span></label>
					</div> 
 		 <div class="col-lg-9 col-sm-9" style="margin-top: 1%;">
            <textarea class="form-control" style="resize:none;" readonly="readonly" rows="3" id="routingInstruction" placeholder="<spring:message code="enter.routing.instruction" />">${orderShipment.routingInstructions}</textarea>
		</div>
		</div>
		<div class="row">
		<div class="form-group col-lg-2 col-sm-2 lbl" style="text-align:right;margin-top: 3%;">                   
					<label><spring:message code="packagesDescription.label" /> <span style="color:red; font-size:2"></span></label>
					</div> 
 		 <div class="col-lg-9 col-sm-9" style="margin-top: 1%;">
            <textarea class="form-control" style="resize:none;" readonly="readonly" rows="3" id="packagesDescription" placeholder="<spring:message code="enter.packagesDescription.label" />">${orderShipment.packagesDescription}</textarea>
		</div>
		</div>
		<div class="row">
		<div class="form-group col-lg-2 col-sm-2 lbl" style="text-align:right;margin-top: 3%;">                   
					<label><spring:message code="remarks.label" /> <span style="color:red; font-size:2"></span></label>
					</div> 
 		 <div class="col-lg-9 col-sm-9" style="margin-top: 1%;">
            <textarea class="form-control" style="resize:none;" readonly="readonly" rows="3" id="remarks" placeholder="<spring:message code="enter.remarks.label" />">${orderShipment.remarks}</textarea>
		</div>
	</div>
              <br>                    
          <%-- <div class="row">
          <div class="form-group col-lg-6 col-sm-6">
      <input type="hidden" id="desc"/>
      <input type="text"  class="form-control searchItems" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"  />
		<div class="services">
 			<div class="items">
  				<ul class="matchedStringUl " style=""></ul>
			</div>
		</div>
   </div>
   <div class="col-lg-5 col-sm-5">
   		<div class="form-group col-lg-9 col-sm-9" style="">
					<input type="text" class="form-control searchItems" name="salesOrders" id="salesOrders" value="" placeholder="<spring:message code="search.orders.label" />"  style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
					<div class="services">
			 			<div class="items">
			  				<ul class="matchedStringUl salesOrders" style=""></ul>
						</div>
					</div>
				</div>
				<div class="form-group col-lg-3 col-sm-3" style="padding-right: 0px;padding-left: 0px;">
				<div class="buttons" style="float: right;">
					<a onclick="clearSalesOrders()" class="button"><font size="2px"><spring:message code="sales.orders.label" /> +</font></a>
				</div>
             </div>
   </div>
             </div> --%>
             <br>
             <div class="row">
                 <div class="form-group col-lg-11 col-sm-11" style="margin-top: -0.2%;">
                     <div class="table-responsive" style="overflow-x: auto;">
                        <table id="productsList" class="table table-bordered table-hover">
                          <thead style="background-color: #3c8dbc; color: #ffffff">
                            <tr>
                            	<th><div style="width: 45px;"><spring:message code="sl.no.label" /></div></th>
                                <th><div style="width: 55px;text-align: center;"><spring:message code="order_id.label"/></div></th>
                            	<th><div style="width: 50px;text-align: center;"><spring:message code="item_id.label"/></div></th>
                                <th><div style="width: 75px;text-align: center;"><spring:message code="item_description.label"/></div></th>
                                <th><spring:message code="item_price.label"/></th>
                                <th><spring:message code="order_quantity.label"/></th>
                                <th><spring:message code="item_cost.label"/></th>
                                <th><spring:message code="make.label"/></th>
                                <th><spring:message code="model.label"/></th>
                                <th><spring:message code="colour.label"/></th>
                                <th><spring:message code="size.label"/></th>
                                <th style="display: none;"><spring:message code="action.label"/></th>
                           </tr>
                          </thead>
            			<tbody style="text-align: center;">
            				<c:forEach var="item" items="${orderShipment.shipmentItemsList}" varStatus="theCount">
                            	 <tr id="dynamicdiv${theCount.count}" style='margin-top:5px;'>
                            	 	<td class='slno'>${theCount.count}</td>
                            	 	<td class='orderId' id='orderId${theCount.count}'>${item.orderId}</td>
                                	<td id="itemId${theCount.count}">${item.itemId}</td>
                                	<input type="hidden" id="skuId${theCount.count}" value="${item.skuId}" />
                                	<input type="hidden" id="pluCode${theCount.count}" value="${item.pluCode}" />
	 								<input type="hidden" id="shipmentChrg${theCount.count}" value="${item.shipmentCharge}" />
	 								<input type='hidden' class='taxRate' id="taxValue${theCount.count}" value="${item.taxValue}"/>
                                    <td id="itemName${theCount.count}">${item.itemDescription}</td>
                                    <td id="itemPrice${theCount.count}">${item.price}</td>
                                    <input type="hidden" id="ordered${theCount.count}" value="${item.quantity}" />
                                    <td id="orderedQuantity${theCount.count}"  class='Pack'>${item.quantity}</td>
                                  	<td id="totalCost${theCount.count}" class='cost'>${item.total}</td>
                                    <td id="make${theCount.count}">${item.make}</td>
                                    <td id="model${theCount.count}">${item.model}</td>
                                    <td id="colour${theCount.count}">${item.color}</td>
                                    <td id="size${theCount.count}">${item.size}</td>
                                    <td style="display: none;" id="Del${theCount.count}"><img id="Img${theCount.count}"alt=""  style='width:15%;cursor:pointer;'  onclick='deleteItem(this);' src="${pageContext.request.contextPath}/images/itemdelete.png"/></td>
                                </tr>
                               </c:forEach>
            			</tbody>
                      </table>
                      <br/>
                    </div>
                    <table id="locationsList" class="table table-bordered table-hover">
            			<tbody style="display: none;">
            			<c:forEach var="loc" items="${orderShipment.shipmentLocations}" varStatus="theCount">
            				 <tr id='div${theCount.count}' style='margin-top:5px;'>
            				 	<td class='slnoLoc'>${theCount.count}</td>
            				 	<td class='orderIdLoc' id='orderIdLoc${theCount.count}'>${loc.orderId}</td>
            				 	<td id='plotNumber${theCount.count}'>${loc.plotNumber}</td>
								<td id='streetName${theCount.count}'>${loc.streetName}</td>
								<td id='location${theCount.count}'>${loc.location}</td>
								<td id='city${theCount.count}'>${loc.city}</td>
								<td id='zip${theCount.count}'></td>
								<td id='state${theCount.count}'></td>
								<td id='country${theCount.count}'></td>
							</tr>
						</c:forEach>
            			</tbody>
                      </table>
            	 </div>
             </div>
             <br>
             <div class="row">
             <div class="form-group col-lg-5 col-sm-5"></div>
             	<div class="form-group col-lg-6 col-sm-6">
                 <div class="form-group col-lg-6 col-xs-6 col-sm-6" style="text-align:right;">                   
					<label><spring:message code="sub.total.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-6 col-xs-6 col-sm-6">
					<input type="text" readonly="readonly" class="form-control" name="subTotal" id="subTotal" value="${orderShipment.subTotal}" placeholder=""/>
					<span id="subTotalError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>         
				<div class="form-group col-lg-6 col-xs-6 col-sm-6" style="text-align:right;">                   
					<label><spring:message code="total.tax.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-6 col-xs-6 col-sm-6">
					<input type="text" readonly="readonly" class="form-control" name="totalTax" id="totalTax" value="${orderShipment.taxStr}" placeholder=""/>
					<span id="totalTaxError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>        
				<div class="form-group col-lg-6 col-xs-6 col-sm-6" style="text-align:right;">                   
					<label><spring:message code="shipment_charges.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-6 col-xs-6 col-sm-6">
					<input type="text" readonly="readonly" class="form-control" name="shipmentCharges" id="shipmentCharges" value="${orderShipment.shipmentCostStr}" placeholder=""/>
					<span id="shipmentChargesError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>                       
                </div>
           </div>                          
				<div class="row">
					<div class="col-lg-11 col-sm-11" >
						<hr style="margin-top: -5px;margin-bottom:25px; width: 97%;border-top: 1px solid rgb(192,192,192);" />
					</div>
				</div>		
             <div class="row">
             	<div class="col-lg-5"></div>
             	<div class="col-lg-6" style="margin-top: -20px;">
	             	<div class="col-lg-6 col-xs-6 col-sm-6" style="text-align:right;">                   
						<label><spring:message code="total.order.value.label" /> <span style="color:red; font-size:2"></span></label>
						</div>
	                <div class="col-lg-6 col-xs-6 col-sm-6">
						<label id="totalOrderValues" style="margin-left: 10px;">${orderShipment.totalCostStr}</label>
					</div> 
				</div>
             </div>
             <div class="row">
					<div class="col-lg-11" >
						<hr style="margin-top: 5px;width: 97%;border-top: 1px solid rgb(192,192,192);" />
					</div>
				</div>	
             <br>				                                    
						</div> <!-- /.box-body -->
						<div class="row" style="text-align: center;">
								<input type="button" class="btn bg-olive btn-inline" onclick="viewOutletShipments('','','0');" style="margin-left:1%;margin-right: 1%;" value="<spring:message code="cancel.label" />" />
						</div>
                        <div class="box-footer"></div>
                   </form>
           </div>

</div>
</div>
</section><!-- /.content -->
</body>
</html>
		    		 