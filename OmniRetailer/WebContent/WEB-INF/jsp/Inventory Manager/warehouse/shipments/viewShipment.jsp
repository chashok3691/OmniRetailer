<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/shipments/newShipment.jsp
 * file type		        : JSP
 * description				: The new shipment is displayed using this jsp
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
<%-- 	<script src="${pageContext.request.contextPath}/js/jquery-1.6.4.min.js"></script>  --%>

 <script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/order.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/shipment.js"></script> 
	<script src="${pageContext.request.contextPath}/js/demo-compiled.js"></script>
<script type="text/javascript">
$(document).ready(function(){
/* var dateTime = getCurrentDate();
var date = dateTime.split(' ');
date = date[0].split('/');
var formatedDate = date[1]+"/"+date[0]+"/"+date[2];
$('#date').val(formatedDate);*/
var phoneNo = $("#shipmentAgencyContact").val();
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
<%-- <section class="content-header">
	  <h1><spring:message code="warehouse.management.label" />
     <small><spring:message code="shipment.label" /></small>
    </h1>
      <ol class="breadcrumb">
      	<li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
        <li class="active"><spring:message code="warehouse.management.label" /></li>
       </ol>
</section> --%>

<!-- Main content -->
<section class="content">
 <div class="row">
  <div class="col-lg-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center">
                                <br/>
                                <h3>${shipmentBean.shipmentId} - Details</h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form id="newShipment" method="post" >
                                    <div class="box-body">
                                   	 <div class="row" style="text-align: right; margin-top: -27px;">
                                   		<div id="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
										<%-- <input type="button" class="btn bg-olive btn-inline" onclick="validateShipment('edit');"  value="&nbsp;&nbsp;<spring:message code="save.label" />&nbsp;&nbsp;" /> --%>
										<input type="button" class="btn bg-olive btn-inline" onclick="viewShipmentsByLocation();" style="margin-left:1%;margin-right: 1%;" value="<spring:message code="cancel.label" />" />
										<hr style="margin-top: 4px;width: 99%;" />
									</div> 
                                   	<div class="row">
	                                   	<div class="form-group col-lg-3">
	                                      	<label><spring:message code="sales_location.label" /> <span style="color:red; font-size:2">*</span></label>
	                                            <select class="form-control" name="warehouse_location" disabled="disabled" id="warehouseLocation" onchange="getWarehouseOrderIds();">
	                                             <c:forEach var="location" items="${locationsList}">
													<option value="${location}" ${location == shipmentBean.warehouse_location ? 'selected' : ''}>${location}</option>
												 </c:forEach>
												 </select>
	                                     </div>
                                   		<div class="form-group col-lg-3">
                                            <label><spring:message code="order_id.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <select class="form-control" name="orderId" id="orderId" disabled="disabled" onchange="getWarehouseOrderForShipment();">
                                            	<c:forEach var="order" items="${orderIdList}">
													<option value="${order}" ${order == shipmentBean.orderId ? 'selected' : ''}>${order}</option>
												</c:forEach>
                                            </select>
                                        </div>
                                     	<div class="form-group col-lg-3">
                                            <label><spring:message code="shipment.note.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <select class="form-control" name="shipmentNote" disabled="disabled" id="shipmentNote">
	                                            <option value="SD123" ${'SD123' == shipmentBean.shipmentNote ? 'selected' : ''}>SD123</option>
	                                            <option value="SD345" ${'SD345' == shipmentBean.shipmentNote ? 'selected' : ''}>SD345</option>
	                                            <option value="SD678" ${'SD678' == shipmentBean.shipmentNote ? 'selected' : ''}>SD678</option>
                                            </select>
                                         </div>
                                          <div class="form-group col-lg-3">
                                            <label><spring:message code="shipmentDate.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input type="text" name="shipmentDate" id="date" readonly="readonly" value="${shipmentBean.shipmentDate}" class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/>
                                        </div><!-- /.input group -->
                                           <span id="shipmentDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
                                       
                                      </div>
                                      <div class="row">
                                        <div class="form-group col-lg-3">
                                            <label><spring:message code="shipmentAgency.label" /></label>
                                            <input type="text" class="form-control" name="shipmentAgency" readonly="readonly" value="${shipmentBean.shipmentAgency}" id="shipmentAgency" required  placeholder="<spring:message code="enter.shipmentAgency.label" />" />
                                            <span id="shipmentAgencyError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                         <div class="form-group col-lg-3">
                                            <label><spring:message code="shipmentAgencyContact.label" /></label>
                                             <div class="row">
				                                  <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
				                                  	<select class="form-control" disabled="disabled" style="padding: 6px 6px;" id="defaultCountry" title="India - IN &#013;USA - US &#013;UK - GB &#013;Australia - AU">
				                                  	<option selected="selected">IN</option>
				                                  	<option>US</option>
				                                  	<option>GB</option>
				                                  	<option>AU</option>
				                                  	</select>
				                                  </div>
				                                  <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px">
				                                  	<input type="text" class="form-control" readonly="readonly" placeholder="<spring:message code="enter.customer_contact_num.label" />" id="phoneNumber" size="15" maxlength="15" oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"/>
				                                  </div>
				                                  <input type="hidden" class="form-control" name="shipmentAgencyContact" id="shipmentAgencyContact"  value="${shipmentBean.shipmentAgencyContact}"/>
				                                   <input type="hidden" id="output" />
				                             </div>
				                        	<span id="error" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                         <div class="form-group col-lg-3">
                                            <label><spring:message code="inspectedBy.label" /></label>
                                            <input type="text" class="form-control" name="inspectedBy" readonly="readonly" id="inspectedBy" value="${shipmentBean.inspectedBy}" placeholder="<spring:message code="enter.inspectedBy.label" />" />
                                            <span id="inspectedByError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                         <div class="form-group col-lg-3">
                                            <label><spring:message code="shippedBy.label" /></label>
                                            <input type="text" class="form-control" name="shippedBy" readonly="readonly" id="shippedBy" value="${shipmentBean.shippedBy}"  placeholder="<spring:message code="enter.shippedBy.label" />"  />
                                            <span id="shippedByError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                         </div>
                                         
                                   <div class="row">
                                    <div class="form-group col-lg-3">
                                            <label style="text-decoration: underline; font-size: 16px;"><spring:message code="shipmentAddress.label" /></label>
                                     </div>
                                     </div>
                                      <div class="row">
                                      	<div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="doorNo.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="shipDno" readonly="readonly" name="shipmentDoorNo" value="${shipmentBean.shipmentDoorNo}" placeholder="<spring:message code="enter.shipement_address_doorNo.label" />"/>
                                            <span id="shipDnoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                    	</div>
                                    	<div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="shipment_street.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="shipStreet" readonly="readonly" name="shipmentStreet" value="${shipmentBean.shipmentStreet}" placeholder="<spring:message code="enter.shipment_street.label" />"/>
                                            <span id="shipStreetError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     	</div>
                                      	<div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="shipment_location.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="shipLoc" readonly="readonly" name="shipmentLocation" value="${shipmentBean.shipmentLocation}" placeholder="<spring:message code="enter.shipment_location.label" />"/>
                                            <span id="shipLocError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                     	</div>
                                       	<div class="form-group col-lg-3" style="margin-top: -19px;">
                                            <label><spring:message code="shipment_city.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" id="shipCity" readonly="readonly" name="shipmentCity" value="${shipmentBean.shipmentCity}" placeholder="<spring:message code="enter.shipment_city.label" />"/>
                                            <span id="shipCityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                    	</div>
                                      </div>
                                         
                                      <div class="row">
                                      	<div class="form-group col-lg-3" >
                                            <label><spring:message code="rfidTagNo.label" /></label>
                                            <input type="text" class="form-control" value="${shipmentBean.rfidTagNo}" readonly="readonly" name="rfidTagNo" placeholder="<spring:message code="enter.rfidTagNo.label" />"/>
                                    	</div>
                                    	<div class="form-group col-lg-3" >
                                            <label><spring:message code="gatePassRef.label" /></label>
                                            <input type="text" class="form-control" value="${shipmentBean.gatePassRef}" readonly="readonly" name="gatePassRef" placeholder="<spring:message code="enter.gatePassRef.label" />"/>
                                     	</div>
                                     	<div class="form-group col-lg-3" >
                                            <label><spring:message code="shipment.status.label" /></label>
                                     		 <select class="form-control" name="shipmentStatus" disabled="disabled" id="shipmentStatus">
	                                            <option value="Ready" ${'Ready' == shipmentBean.shipmentStatus ? 'selected' : ''}>Ready</option>
	                                            <option value="Shipped" ${'Shipped' == shipmentBean.shipmentStatus ? 'selected' : ''}>Shipped</option>
	                                            <option value="Delivered" ${'Delivered' == shipmentBean.shipmentStatus ? 'selected' : ''}>Delivered</option>
	                                            <option value="Rejected" ${'Rejected' == shipmentBean.shipmentStatus ? 'selected' : ''}>Rejected</option>
                                            </select>
                                     	</div>
                                     	 <div class="form-group col-lg-3">
                                            <label><spring:message code="shipment_mode.label" /></label>
                                            <select class="form-control" disabled="disabled" name="shipmentMode" id="shipmentMode">
	                                            <option value="Rail" ${'Rail' == shipmentBean.shipmentMode ? 'selected' : ''}>Rail</option>
	                                            <option value="Flight" ${'Flight' == shipmentBean.shipmentMode ? 'selected' : ''}>Flight</option>
	                                            <option value="Express" ${'Express' == shipmentBean.shipmentMode ? 'selected' : ''}>Express</option>
	                                            <option value="Ordinary" ${'Ordinary' == shipmentBean.shipmentMode ? 'selected' : ''}>Ordinary</option>
                                            </select>
                                    	</div>
                                     	</div>
                                     	<div class="row">
                                      	<div class="form-group col-lg-6">
                                            <label><spring:message code="packagesDescription.label" /></label>
                                            <textarea class="form-control" style="resize: none;" readonly="readonly" name="packagesDescription" placeholder="<spring:message code="enter.packagesDescription.label" />">${shipmentBean.packagesDescription}</textarea>
                                     	</div>
                                     	<div class="form-group  col-lg-6">
                                         	<label><spring:message code="remarks.label" /></label>
                                            <textarea class="form-control" style="resize: none;" readonly="readonly" name="remarks" id="remarks" rows="2" placeholder="<spring:message code="enter.remarks.label" />" >${shipmentBean.remarks}</textarea>
 										 </div>
                                      </div> 
                                    <div class="table-responsive">
                                        <table id="productsList" class="table table-bordered table-hover">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="item_id.label"/></th>
                                                <th><spring:message code="item_description.label"/></th>
                                                <th><spring:message code="item_price.label"/></th>
                                                <th><spring:message code="order_quantity.label"/></th>
                                                <th><spring:message code="item_cost.label"/></th>
                                                <th><spring:message code="make.label"/></th>
                                                <th><spring:message code="model.label"/></th>
                                                <th><spring:message code="colour.label"/></th>
                                                <th><spring:message code="size.label"/></th>
                                                <th><spring:message code="action.label"/></th>
                                           </tr>
                                          </thead>
                                          
                            			<tbody style="text-align: center;">
                                        <c:forEach var="item" items="${shipmentBean.shipmentItemsList}" varStatus="theCount">
                                        	 <tr id="dynamicdiv${theCount.count}" style='margin-top:5px;'>
                                            	<td id="itemId${theCount.count}">${item.itemId}<input type="hidden" id="skuId${theCount.count}" value="${item.skuId}" /></td>
                                                <td id="itemName${theCount.count}">${item.itemDescription}</td>
                                                <td id="itemPrice${theCount.count}">${item.price}<input type="hidden" id="ordered${theCount.count}" value="${item.quantity}" /></td>
                                                <td id="orderedQuantity${theCount.count}"  class='Pack' onBlur='changePack(this);'>${item.quantity}</td>
                                              	<td id="totalCost${theCount.count}" class='cost'>${item.total}</td>
                                                <td id="make${theCount.count}">${item.make}</td>
                                                <td id="model${theCount.count}">${item.model}</td>
                                                <td id="colour${theCount.count}">${item.color}</td>
                                                <td id="size${theCount.count}">${item.size}</td>
                                                <td id="Del${theCount.count}"><img id="Img${theCount.count}"alt=""  style='width:15%;cursor:pointer;'  onclick='deleteItem(this);' src="${pageContext.request.contextPath}/images/itemdelete.png"/></td>
                                            </tr>
                                           </c:forEach>
                                           </tbody>
                                        </table>
                                    </div>
                                     
                                   <div class="row">
                                    <div class="form-group col-lg-6"></div>
                                     <div class="form-group col-lg-3" style="text-align: right;"><label><spring:message code="shipment.tax.label" /></label></div>
                                     <div class="form-group col-lg-3">
                                            <input type="text" class="form-control" name="tax" readonly="readonly" id="orderTax" value="${shipmentBean.tax}"/>
                                     </div>   
                                   </div>
                                   <div class="row">
                                     <div class="form-group col-lg-6">
                                      </div>   
                                      <div class="form-group col-lg-3" style="text-align: right;"> <label><spring:message code="shipment_charges.label" /></label></div>
                                    <div class="form-group col-lg-3">
                                            <input type="text" class="form-control" name="shipmentCost" readonly="readonly" id="shipmentCharges" value="${shipmentBean.shipmentCost}"/>
                                     </div>
                                   </div> 
                                    <div class="row">
										<div class="col-lg-6"></div>
										<div class="col-lg-3" style="text-align: right;"><label><spring:message code="cost.label" /> </label></div>
										<div class="col-lg-3">
											<input type="text" class="form-control" id="orderTotalCost" name="totalCost" readonly value="${shipmentBean.totalCost}"/>
										</div>
									</div>
									<input type="hidden" name="items" id="itemDetails">
									<input type="hidden" name="noPackages" id="totalQty" value="${shipmentBean.noPackages}">
                          <br/>
						 <div class="row" style="text-align: right;">
						<%-- <input type="button" class="btn bg-olive btn-inline" onclick="validateShipment('edit');" value="&nbsp;&nbsp;<spring:message code="save.label" />&nbsp;&nbsp;" /> --%>
						<input type="button" class="btn bg-olive btn-inline" onclick="viewShipmentsByLocation();" style="margin-left:1%;margin-right: 1%;" value="<spring:message code="cancel.label" />" />
						</div> 
					<br/>
				 </div><!-- /.box-body -->
                <div class="box-footer">
                                     
                </div>
               </form>
             </div>
</div>
</div>
</section><!-- /.content -->
<script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
 <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
 <script src="${pageContext.request.contextPath}/js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
<script type="text/javascript">
  $(function() {
        $("#date").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"}); 
   });
</script>
</body>
</html>