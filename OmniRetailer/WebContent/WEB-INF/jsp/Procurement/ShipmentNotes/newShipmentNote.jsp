<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri.S
 * file type		        : JSP
 * description				: The newShipmentNote form is displayed using this jsp
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/procurement/shipmentNotes.js"></script>
	<script src="${pageContext.request.contextPath}/js/demo-compiled.js"></script>	
	<style type="text/css">
  /* .odd{display:none!important;} */
.buttons {
	float: left;
	padding-top: 0px;
	margin-right: 2%;
	margin-top:1%;
}
a.button, .list a.button {
position:relative;
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 3.6px 10px 3.8px 10px;
	/* border-radius: 5px; */
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
	font-weight: normal; 
    background-color: rgb(128,128,128);
}
@media (min-width:1200px) and (max-width:1600px)
{
	.lbl{
		text-align:right;
		padding-right: 0px;
	}
}
@media only screen and (max-width:1200px)
{
.lbl{
		text-align:left;
	}
}
.row-fluid-5 {
   width: 100%;
   *zoom: 1;
 }
 .row-fluid-5:before,
 .row-fluid-5:after {
   display: table;
   line-height: 0;
   content: "";
 }
 .row-fluid-5:after {
   clear: both;
 }
 .row-fluid-5 [class*="span"] {
   display: block;
   float: left;
   width: 100%;
   min-height: 30px;
   margin-left: 1.875%;
   *margin-left: 1.875%;

   -webkit-box-sizing: border-box;
      -moz-box-sizing: border-box;
           box-sizing: border-box;
 }
 .row-fluid-5 .controls-row [class*="span"] + [class*="span"] {

   margin-left: 1.875%;
 }
 .row-fluid-5 [class*="span"]:first-child{
    margin-left: 0;
 }
 .row-fluid-5 .span2 {
   width: 18.5%;
   *width: 18.5%;
 }
 /* responsive ONLY */
 @media (max-width: 600px){ /* spans reduce to 100px then go full width */
    .row-fluid-5 [class*="span"]{
    margin-left: 0;
    float: left;
    width: 100%;
    padding: 10px; 
    }
    }
   
 }
</style>
<script type="text/javascript">
$(document).ready(function(){
	
	focusDiv("Error")
/* if($('#orderDate').val() == ""){
	var dateTime = getCurrentDate();
	  var date = dateTime.split(' ');
	  date = date[0].split('/');
	  var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
	  $('#orderDate').val(formatedDate);
} */
var phoneNo = $("#phone").val();
phoneNo = phoneNo.split('-');
if(phoneNo.length == 1)
	$("#phoneNumber").val(phoneNo[0]);
else{
	$("#defaultCountry").val(phoneNo[0]);
	$("#phoneNumber").val(phoneNo[1]);
}
if($('#arrivalDate').val() != ""){
	var date = $('#arrivalDate').val();
	date = date.split(' ');
	$('#arrivalDate').val(date[0]);
}
if($('#shipmentDate').val() != ""){
	var date = $('#shipmentDate').val();
	date = date.split(' ');
	$('#shipmentDate').val(date[0]);
}
if($('#edit').val() != "edit"){
		callCalender("arrivalDate");
		callCalender("shipmentDate");
}
		setLocationsDivContent();
		focusDiv('Error');
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
          <div class="box-header" style="text-align: center;">
          <input type="hidden" id="edit" value="${type}"/>
          <c:if test="${type == 'new'}">
           <h3><spring:message code="warehouse.shipmentnote.label" /></h3>
          </c:if>
          <c:if test="${type != 'new'}">
           <h3><spring:message code="warehouse.shipmentnote.label" /> - ${shipmentNoteObj.shipmentNoteRef}</h3>
          </c:if>
          </div><!-- /.box-header -->
          <!-- form start -->
          <form role="form">
              <div class="box-body">
                <div id="Error" class="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;margin-top: -10px;margin-bottom: 10px;">${err}</div>
				<div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-top: -10px;margin-bottom: 10px;">${success}</div>
                 <div class="row">
                 <input type="hidden" id="outletLocation" />
                 <input type="hidden" id="shipmentNoteRef" value="${shipmentNoteObj.shipmentNoteRef}" />
                 <div class="form-group col-lg-5">
                 <div class="form-group col-lg-4 col-xs-4 lbl" >                   
					<label><spring:message code="Supplier.label" /> <span style="color:red; font-size:2">*</span></label>
				</div>
                <div class="form-group col-lg-6 col-xs-8" style="margin-left: -2%;">
                 <c:if test="${type != 'edit'}">
				<input type="text"  class="form-control searchItems clearError" placeholder="<spring:message code="search.supplier.label" />" style="height:30PX;!important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" name="supplier_name" id="searchSupplier" value="${shipmentNoteObj.supplierName}" />
				<div class="services">
				  	<div class="items">
				   		<ul class="matchedStringUl supplier" style="width: 89%!important;padding: 0px!important;"></ul>
				 	</div>
				</div>
				</c:if>
				 <c:if test="${type == 'edit'}">
				 <input type="text"  class="form-control searchItems clearError" readonly="readonly" placeholder="<spring:message code="search.supplier.label" />" name="supplier_name" id="searchSupplier" value="${shipmentNoteObj.supplierName}" />
				 </c:if>
				<span id="supplierNameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
           </div>
            <input type="hidden" class="form-control" name="supplier_Id" id="supplier_Id" readonly="readonly" value="${shipmentNoteObj.supplierId}"/>          
				<div class="form-group col-lg-4 col-xs-4 lbl" >                   
					<label><spring:message code="arrival.date.label" /> <span style="color:red; font-size:2">*</span></label>
				</div>
                <div class="form-group  col-lg-7 col-xs-8" style="margin-left: -2%;">
                <c:if test="${type != 'edit'}">
					<input type="text" class="form-control clearError calendar_icon" value="${shipmentNoteObj.arrivalDateStr}" name="arrivalDate" id="arrivalDate" style="background-color: white;width:50%;" size="20" onfocus="callCalender('arrivalDate')" onclick="callCalender('arrivalDate')" placeholder="DD/MM/YYYY"/>
				</c:if>
				<c:if test="${type == 'edit'}">	
				<input type="text" class="form-control clearError calendar_icon" value="${shipmentNoteObj.arrivalDateStr}" name="arrivalDate" style="width:50%;" id="arrivalDate" readonly="readonly" size="20" onfocus="callCalender('arrivalDate')" onclick="callCalender('arrivalDate')" placeholder="DD/MM/YYYY"/>
				</c:if>
					<span id="arrivalDateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>        
				<div class="form-group col-lg-4 col-xs-4 lbl" >                   
					<label><spring:message code="po.ref.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group  col-lg-6 col-xs-8" style="margin-left: -2%;">
					<input type="text" class="form-control clearError searchItems" value="${shipmentNoteObj.poRef}" style="height:30PX;!important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" placeholder="<spring:message code="enter.po.reference.label" />"  id="po_reference" />
					<div class=services>
			    		<div class="items">
			     			<ul class="matchedStringUl poRef" style="width: 89%!important;padding: 0px!important;"></ul>
			   			</div>
					</div>	
					<input type="hidden" name="po_reference" id="selected_po_ref" value="${shipmentNoteObj.poRef}">
					<span id="poRefError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>                       
                </div>     
                <div class="form-group col-lg-1"></div> 
                <div class="form-group col-lg-5">
                 <div class="form-group col-lg-4 col-xs-4 lbl" >                   
					<label><spring:message code="shipment.ref.label" /> <span style="color:red; font-size:2">*</span></label>
					</div>
                                    
                <div class="form-group col-lg-6 col-xs-8" style="margin-left: -2%;">
                 <c:if test="${type != 'edit'}">
					<input type="text" class="form-control clearError" name="shipmentRef" id="shipmentRef" value="${shipmentNoteObj.shipmentRef}" placeholder="<spring:message code="enter.shipment.ref.label" />"/>
				</c:if>
				 <c:if test="${type == 'edit'}">
				 <input type="text" class="form-control clearError" name="shipmentRef" readonly="readonly" id="shipmentRef" value="${shipmentNoteObj.shipmentRef}" placeholder="<spring:message code="enter.shipment.ref.label" />"/>
				 </c:if>	
					<span id="shipmentRefError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>         
				<div class="form-group col-lg-4 col-xs-4 lbl" >                   
					<label><spring:message code="shipment.date.label" /> <span style="color:red; font-size:2">*</span></label>
					</div>
                                    
                <div class="form-group col-lg-7 col-xs-8" style="margin-left: -2%;">
                <c:if test="${type != 'edit'}">
                	<input type="text" class="form-control clearError calendar_icon" value="${shipmentNoteObj.shippedDateStr}" name="shipmentDate" id="shipmentDate"  style="background-color: white;width:50%;" size="20" onfocus="callCalender('shipmentDate')" onclick="callCalender('shipmentDate')" placeholder="DD/MM/YYYY"/>
				</c:if>
				<c:if test="${type == 'edit'}">
				<input type="text" class="form-control clearError calendar_icon" value="${shipmentNoteObj.shippedDateStr}" name="shipmentDate" id="shipmentDate" readonly="readonly" style="width:50%;" size="20" onfocus="callCalender('shipmentDate')" onclick="callCalender('shipmentDate')" placeholder="DD/MM/YYYY"/>
				</c:if>	
					<span id="shipmentDateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>        
				<div class="form-group col-lg-4 col-xs-4 lbl" >                   
					<label><spring:message code="shipped.from.label" /> <span style="color:red; font-size:2">*</span></label>
					</div>
                                    
                <div class="form-group col-lg-6 col-xs-8" style="margin-left: -2%;">
                <c:if test="${type != 'edit'}">
					<input type="text" class="form-control clearError" name="shippedFrom" id="shippedFrom" value="${shipmentNoteObj.shipmentFrom}" placeholder="<spring:message code="enter.shipped.from.label" />"/>
				</c:if>
				<c:if test="${type == 'edit'}">
				<input type="text" class="form-control clearError" name="shippedFrom" readonly="readonly" id="shippedFrom" value="${shipmentNoteObj.shipmentFrom}" placeholder="<spring:message code="enter.shipped.from.label" />"/>
				</c:if>	
					<span id="shippedFromError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>                       
                </div>                     
                </div>                    
          <div class="row">
				<div class="form-group col-lg-12">
	    	      		<div class="row" >
	                    <div class="form-group col-lg-12" style="height:15px;    margin-top: -2%;" >
	                    <div class="form-group col-lg-2" style="padding-left: 1px;padding-right: 1px;margin-top: 8px;cursor: pointer;margin-bottom: 0px;" onclick="" ><span style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;"><spring:message code="carrier.details.label" /></span></div>
	                     <div class="form-group col-lg-10" style="margin-bottom: 4px;">
	                    	<img style="float: right;cursor: pointer;margin-right: -16px;margin-top: 0px;margin-bottom: -26px" onclick="activateHeader('priceList');" id="priceListImg" alt="" <%-- src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png" --%>>
	                     </div> 
	                    <hr style="margin-top: 31px;width: 100%;border-top: 1px solid rgb(192,192,192);" />
	                    </div>
	                </div>
             	</div>
             </div><br>
             <div class="row">
             	<div class="form-group col-lg-5">
                 <div class="form-group col-lg-4 col-xs-4 lbl" >                   
					<label><spring:message code="transporter.code.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-6 col-xs-8" style="margin-left: -2%;">
					<input type="text" class="form-control clearError" name="transporterCode" id="transporterCode" value="${shipmentNoteObj.transporterCode}" placeholder="<spring:message code="enter.transporter.code.label" />"/>
					<span id="transporterCodeError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>         
				<div class="form-group col-lg-4 col-xs-4 lbl" >                   
					<label><spring:message code="transporter.name.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-6 col-xs-8" style="margin-left: -2%;">
					<input type="text" class="form-control clearError" name="transporterName" id="transporterName" value="${shipmentNoteObj.transporterName}" placeholder="<spring:message code="enter.transporter.name.label" />"/>
					<span id="transporterNameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>        
				<div class="form-group col-lg-4 col-xs-4 lbl" >                   
					<label><spring:message code="carrier.no.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-5 col-xs-8" style="margin-left: -2%;">
					<input type="text" class="form-control clearError" name="carrierNo" id="carrierNo" value="${shipmentNoteObj.carrierNo}" placeholder="<spring:message code="enter.carrier.no.label" />"/>
					<span id="carrierNoError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>                       
                </div>
                <div class="col-lg-1"></div>
                <div class="form-group col-lg-5">
                 <div class="form-group col-lg-4 col-xs-4 lbl" >                   
					<label><spring:message code="delivery.person.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-6 col-xs-8" style="margin-left: -2%;">
					<input type="text" class="form-control clearError" name="deliveryPerson" id="deliveryPerson" value="${shipmentNoteObj.deliveryPerson}" placeholder="<spring:message code="enter.delivery.person.label" />"/>
					<span id="deliveryPersonError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>         
				<div class="form-group col-lg-4 col-xs-4 lbl" >                   
					<label><spring:message code="contact.no.label" /> <span style="color:red; font-size:2"></span></label>
					</div>
                                    
                <div class="form-group col-lg-7 col-xs-8" style="margin-left: -2%;">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                    	<select class="form-control clearError" style="" id="defaultCountry" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
                    		<option selected="selected">IN</option>
                    		<option>US</option>
                    		<option>GB</option>
                    		<option>AU</option>
                    	</select>
                    </div>
                    <div class="col-lg-7 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
                    	<input type="text" class="form-control clearError" placeholder="<spring:message code="enter.phone.label" />" id="phoneNumber" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
                    </div>
                    <input type="hidden" class="form-control" name="phone" id="phone"  value="${shipmentNoteObj.contactNumber}"/>
                     <input type="hidden" id="output" />
               </div>
				<span id="error" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
				</div>        
                </div> 
           </div>                          
								                                    
				<div class="row">
						<br>
						 <div class="form-group col-lg-12" style="text-align:center;  margin-bottom: 0.3%;">
							<input type="text"  class="form-control clearError searchItems" id="searchItems"  placeholder="<spring:message code="search.items.here.label" />"  style="height:30PX;text-align:left;!important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" />
								<div class="services">
						    		<div class="items">
						     			<ul class="matchedStringUl apparel" style=""></ul>
						   			</div>
								</div>
						</div>
					</div>		
                    <div class="table-responsive">
                    <table id="productsList" class="table table-bordered table-hover">
                      <thead style="background-color: #3c8dbc; color: #ffffff">
                        <tr>
                        	<th><div style="width:45px;"><spring:message code="sl.no.label" /></div></th>
                        	<th><spring:message code="item.name.label"/></th>
                            <th><spring:message code="item.desc.label"/></th>
                            <th><spring:message code="price.label"/></th>
                            <th><spring:message code="pack.label"/></th>
                            <th><spring:message code="cost"/></th>
                            <th><spring:message code="make.label"/></th>
                            <th><spring:message code="model.label"/></th>
                            <th><spring:message code="colour.label"/></th>
                            <th><spring:message code="size.label"/></th>
                            <th><spring:message code="action.label"/></th>
                        </tr>
                      </thead>
                      <tbody style="text-align: center;">
	                       <c:forEach var="item" items="${shipmentNoteObj.shipmentNoteItems}" varStatus="theCount">
		             		   <tr id="dynamicdiv${theCount.count}">
		             		   		<td class="slno">${theCount.count}</td>
			              			<td id="itemId${theCount.count}">${item.itemId}</td>
			              			<input type="hidden" id="skuId${theCount.count}" value="${item.itemId}" />
			              			<input type="hidden" id="pluCode${theCount.count}" value="${item.pluCode}"/>
			                  		<td id="itemDesc${theCount.count}">${item.itemDesc}</td>
			                  		<td id="itemPrice${theCount.count}" class="Price">${item.itemPrice}</td>
			                  		<td  contenteditable="true" ><input type="number" id="quantity${theCount.count}" style="text-align: center;width:75px;" onBlur='changeOrderedPack(this);' class="Pack" value="${item.quantity }" /></td>
			                  		<td id="totalCost${theCount.count}" class="cost" >${item.totalCost}</td>
			                  		<td id="make${theCount.count}">${item.make}</td>
			                  		<td id="model${theCount.count}">${item.model }</td>
			                  		<td id="color${theCount.count}">${item.color}</td>
			                  		<td id="size${theCount.count}">${item.size}</td>
			                  		<td id="Del${theCount.count}"><img id="Img${theCount.count}" src="${pageContext.request.contextPath}/images/itemdelete.png" style="width:15%;cursor:pointer;" onclick="deleteItemDetails(this);" title="Delete"/></td>
		                  	   </tr>
	              		   </c:forEach> 
		 			</tbody>
                   </table>
                </div>
                  <br>
        <div class="row">
				<div class="form-group col-lg-12">
	    	      		<div class="row" >
	                    <div class="form-group col-lg-12" style="height:15px;margin-top: -2%;" >
	                    <div class="form-group col-lg-2" style="padding-left: 1px;padding-right: 1px;margin-top: 8px;cursor: pointer;margin-bottom: 0px;" onclick="" ><span style="font-weight: bold;font-size: 16px;color:#666;cursor: pointer;"><spring:message code="shipment.details.label" /></span></div>
	                     <div class="form-group col-lg-10" style="margin-bottom: 4px;">
	                    	<img style="float: right;cursor: pointer;margin-right: -16px;margin-top: 0px;margin-bottom: -26px" onclick="activateHeader('priceList');" id="priceListImg" alt="" <%-- src="${pageContext.request.contextPath}/images/leftHeaderIconGreen.png" --%>>
	                     </div> 
	                    <hr style="margin-top: 31px;width: 100%;border-top: 1px solid rgb(192,192,192);" />
	                    </div>
	                </div>
             	</div>
             </div>	<br>
        <div class="row">
        	<div class="form-group col-lg-7" id="locationAddError" style="text-align: center;color: red;font-size: 2;font-weight: bold;"></div>
			<div class="form-group col-lg-3">
				<label><spring:message code="location.label" /></label>
				<select class="form-control" id="deliveryLocation" >
					<c:forEach var="location" items="${workLocationsList}">
						<option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group col-lg-2" style="padding-top: 15px;">
				<div class="buttons" style="">
					<a onclick="appendLocationsDiv()" class="button"><font size="2px"><spring:message code="addnew.label" /></font></a>
				</div>
			</div>
		</div>
		<div id="locations" style="display: none;">
			<div class="row-fluid-5 locationRow" id="locations0">
				<div class="form-group span2" >
					<label><spring:message code="location.label" /> <span style="color:red; font-size:2">*</span></label> 
					<input type="text" readonly="readonly" class="form-control addedLocation" id="location0" />
				</div>
				<div class="form-group span2" >
					<label><spring:message code="shipment_street.label" /> <span style="color:red; font-size:2">*</span></label>
					<input type="text" readonly="readonly"  class="form-control" id="street0" />
				</div>
				<div class="form-group span2" >
					<label><spring:message code="area.label" /> <span style="color:red; font-size:2">*</span></label>
					<input type="text" readonly="readonly"  class="form-control" id="area0"  />
				</div>
				<div class="form-group span2" >
					<label><spring:message code="shipment_city.label" /> <span style="color:red; font-size:2">*</span></label> 
					<input type="text" readonly="readonly" class="form-control" id="city0" />
				</div>
				<div class="form-group span2" style="padding-top: 15px;">
					<div class="buttons" style="">
						<a onclick="showPopUp(this);" id="popup0" class="button" style="width:110px;text-align: center;"><font size="2px"><spring:message code="shipments.label" /></font></a>
					</div>
					<span style="width: 60px;margin-left: 15px;">
						<img id="img0" src="${pageContext.request.contextPath}/images/itemdelete1.png" style="width: 24px;cursor: pointer;padding-top: 5px;" onclick="deleteDiv(this)">
					</span>
				</div>
				<div id="relatedItemsDiv0" style="display: none;"><table id="relatedItemsTable0"><tbody></tbody></table></div>
			</div>
		</div>
		<div class="locationsAdded">
			 <c:forEach var="item" items="${shipmentNoteObj.selectedLocationList}" varStatus="theCount">
			 	<div class="row-fluid-5 locationRow" id="locations${theCount.count}">
				<div class="form-group span2" >
					<label><spring:message code="location.label" /> <span style="color:red; font-size:2">*</span></label> 
					<input type="text" readonly="readonly" value="${item.locationId}" class="form-control addedLocation" id="location${theCount.count}" />
				</div>
				<div class="form-group span2" >
					<label><spring:message code="shipment_street.label" /> <span style="color:red; font-size:2">*</span></label>
					<input type="text" readonly="readonly" value="${item.address}" class="form-control" id="street${theCount.count}" />
				</div>
				<div class="form-group span2" >
					<label><spring:message code="area.label" /> <span style="color:red; font-size:2">*</span></label>
					<input type="text" readonly="readonly" value="${item.area}" class="form-control" id="area${theCount.count}"  />
				</div>
				<div class="form-group span2" >
					<label><spring:message code="shipment_city.label" /> <span style="color:red; font-size:2">*</span></label> 
					<input type="text" readonly="readonly" value="${item.city}" class="form-control" id="city${theCount.count}" />
				</div>
				<div class="form-group span2" style="padding-top: 15px;">
					<div class="buttons" style="">
						<a onclick="showPopUp(this);" id="popup${theCount.count}" class="button" style="width:110px;text-align: center;"><font size="2px"><spring:message code="shipments.label" /></font></a>
					</div>
					<span style="width: 60px;margin-left: 15px;">
						<img id="img${theCount.count}" src="${pageContext.request.contextPath}/images/itemdelete1.png" style="width: 24px;cursor: pointer;padding-top: 5px;" onclick="deleteDiv(this)">
					</span>
				</div>
				<div id="relatedItemsDiv${theCount.count}" style="display: none;"><table id="relatedItemsTable${theCount.count}"><tbody>
					<c:set var="poCount" value="1"></c:set>
					 <c:forEach var="poLoc" items="${shipmentNoteObj.shipmentNoteLocations}" >
						 <c:if test="${item.locationId == poLoc.storeLocation}">
								<tr id="selected_${poCount}" style='margin-top:5px;'>
									<td class="selecetedSlno_">${poCount}</td>
									<td id="selectedItemId_${poCount}">${poLoc.skuId}</td>
									<input type='hidden' id='selectedSkuId_${poCount}' value="${poLoc.skuId}" />
									<input type='hidden' id='selectedPluCode_${poCount}' value="${poLoc.pluCode}" />
									<td id='selectedItemDesc_${poCount}'>${poLoc.skuName}</td>
									<td id='selectedItemPrice_${poCount}'>${poLoc.skuPrice}</td>
									<td contenteditable='true' id='selectedQuantity_${poCount}' class='selectedPack ${poLoc.pluCode}' onBlur='changeSelectedPack(this);' onkeypress='return numerics(event);'>${poLoc.quantity}</td>
									<td class='selectedCost' id='selectedTotalCost_${poCount}'>${poLoc.totalCost}</td>
									<td id='selectedDel_${poCount}' ><img id='selectedImg_${poCount}' src="${pageContext.request.contextPath}/images/itemdelete.png" style='width:15%;cursor:pointer;' onclick='deleteSelectedItemDetails(this);' title='Delete ${poLoc.skuId}'/></td>
									<c:set var="poCount" value="${poCount + 1}" />
								</tr>
						 </c:if>
					</c:forEach>
				</tbody></table></div>
			</div>
			 </c:forEach>
		</div>
		<br>
		<div class="row">
			<div class="form-group col-lg-6">
				<label><spring:message code="shipment.terms.label" /></label>
				<textarea  class="form-control clearError" placeholder="<spring:message code="enter.shipment.terms.label" />" name="shipmentTerms" id="shipmentTerms" style="resize: none;" >${shipmentNoteObj.shipmentTerms}</textarea>
			</div>
		
			<div class="form-group col-lg-6">
				<label><spring:message code="shipment.comments.label" /></label>
				<textarea  class="form-control clearError" placeholder="<spring:message code="enter.shipment.comments.label" />" name="shipmentComments" id="shipmentComments" style="resize: none;" >${shipmentNoteObj.shipmentComments}</textarea>
			</div>
		</div>
		<!-- COMPOSE MESSAGE MODAL -->
       <div id="triggerEvent"></div>
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
 
 
  <!-- added by manasa -->
  <input type="hidden" id="outletLocation" value="${skuObj.location}">
				  <input type="hidden" id="from" value="${skuObj.startDate}">
        <input type="hidden" id="to" value="${skuObj.endDate}">
 <!-- //..added by manasa -->
 
 <div class="modal fade popup-display" id="selected-items-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" style="width: 125%;">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
             <form action="#" method="post">
                 <div class="modal-body">
                  <div class="box-body table-responsive">
                  	<input type='hidden' id='selectedLocationId' >
                     <table id="selectedItemsList" class="table table-bordered table-hover">
                       <thead style="background-color: #3c8dbc; color: #ffffff">
                         <tr>
                             <th><div style="width:45px;"><spring:message code="sl.no.label" /></div></th>
							 <th><spring:message code="item.name.label" /></th>
							 <th><spring:message code="item.desc.label" /></th>
							 <th><spring:message code="price.label" /></th>
							 <th><spring:message code="pack.label" /></th>
							 <th><spring:message code="cost" /></th>
							 <th><spring:message code="action.label"/></th>
                         </tr>
                       </thead>
                       <tbody style="text-align: center;">
                       	
			 			</tbody>
                    </table>
                 </div>
                 <div class="row" style="text-align: center;">
                 	<input type="hidden" id="status">
                 		<input type="button" id="saveSelection"  class="btn bg-olive btn-inline" style="margin-left:1%;margin-right:1%;width: 68px;" onclick="saveSelectedSkus();" value="<spring:message code="save.label" />" />
						<input type="button" id="cancelSelection" class="btn bg-olive btn-inline" style="margin-right: 1%;" data-dismiss="modal" aria-hidden="true" value="<spring:message code="cancel.label" />" />
                 </div>
              </div>
             </form> 
         </div><!-- /.modal-content -->
     </div><!-- /.modal-dialog -->
 </div><!-- /.modal -->
						</div><!-- /.box-body -->
<br><br>
						<input type="hidden" id="flowUnder" value="${flowUnder}">
						<div class="row" style="text-align: center;margin-right:3%;">
							<c:if test="${type == 'new'}">
			        			<input type="button" id="edit" style="width: 80px;margin-right: 25%" class="btn bg-olive btn-inline" onclick="validateShipmentNote('Submitted','new');" value="<spring:message code="submit.label" />" />
			        		</c:if>
			        		<c:if test="${type != 'new'}">
			        			<input type="button" id="edit" style="width: 80px;margin-right: 25%;" class="btn bg-olive btn-inline" onclick="validateShipmentNote('Submitted','edit');" value="<spring:message code="submit.label" />" />
			        		</c:if>
			        		  <c:if test="${sessionScope.role == 'super admin'}">
			        		  		<input type="button" style="width: 80px;" class="btn bg-olive btn-inline" onclick="viewShipmentNotes('','0');" value="<spring:message code="cancel.label" />" />
			        		  </c:if>
			        		<c:if test="${sessionScope.role != 'super admin'}">
			        			<c:if test="${flowUnder == 'procurement'}">
				        			<c:forEach var="accessControl" items="${sessionScope.procurement}">
			                           <c:if test="${accessControl.appDocument == 'ShipmentNotes' && accessControl.read == true}">
											<input type="button" style="width: 80px;" class="btn bg-olive btn-inline" onclick="viewShipmentNotes('','0');" value="<spring:message code="cancel.label" />" />
									  </c:if>
									</c:forEach>
			        			</c:if>
			        			<c:if test="${flowUnder == 'warehouse'}">
				        			<c:forEach var="accessControl" items="${sessionScope.warehouseProcurement}">
			                           <c:if test="${accessControl.appDocument == 'WarehouseShipmentNotes' && accessControl.read == true}">
											<input type="button" style="width: 80px;" class="btn bg-olive btn-inline" onclick="viewShipmentNotes('','0');" value="<spring:message code="cancel.label" />" />
									  </c:if>
									</c:forEach>
			        			</c:if>
			        		</c:if>
			        		
						</div>
						<br/>
                                    <div class="box-footer">
                                     <!--    <button type="submit" class="btn btn-primary">Submit</button> -->
                                    </div>
                                    
                                </form>
                            </div>

</div>
</div>
</section><!-- /.content -->

        <script type="text/javascript">
            $(function() {
               /* $('#productsList').dataTable({
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
		    		 