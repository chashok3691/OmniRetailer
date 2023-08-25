<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/warehouse/procurement/newPurchaseOrder.jsp
 * file type		        : JSP
 * description				: The new purchase order can be saved using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Home | Omni Retailer</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/validation.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/controller.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/procurement.js"></script>


<script type="text/javascript">
	
</script>

<script type="text/javascript">
/* $(document).ready(function(){
	 var date = getCurrentDate();
	$("#orderDate").val(date); 
}); */

</script>

</head>
<body>
	<!-- Content Header (Page header) -->

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-lg-12">
				<div class="box box-primary">
					<div class="box-header" style="text-align: center">
						<br />
						<h3>
							<spring:message code="new.po.details.label" />
						</h3>
					</div>
					<!-- /.box-header -->
					<!-- form start -->
					<form method="post">
						<div class="box-body">
						<div class="row" style="text-align: right; margin-top: -27px;">
						 	<div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
							<input type="button" id="edit" style="position: relative;" class="btn bg-olive btn-inline" onclick="validatePurchaseOrder('submitted','new');" value="<spring:message code="submit.label" />" />
							<input type="button" id="edit"  class="btn bg-olive btn-inline" style="margin-left:1%;width: 68px;position: relative;" onclick="validatePurchaseOrder('draft','new');" value="<spring:message code="save.label" />" />
							<input type="button" class="btn bg-olive btn-inline" style="margin-left:1%;margin-right: 1%;position: relative;" onclick="viewPurchaseOrder('all','purchaseOrder');" value="<spring:message code="cancel.label" />" />
							<hr style="margin-top: 4px;width: 99%;" />
						</div>
							<div class="row">
								<div class="form-group col-lg-3">
									<label><spring:message code="order_date.label" /></label>
									<!-- <input type="text" id="orderDate" readonly="readonly" class="form-control"> -->
									   <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input type="text" name="order_date" id="orderDate" required value="" class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/>
                                        </div> <!-- /.input group -->
									<span id="orderDateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								<div class="form-group col-lg-3">
									<label><spring:message code="delivery_date.label" /></label>
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" name="delivery_due_date" id="deliveryDate" required value="" class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask />
									</div>
									<!-- /.input group -->
									<span id="deliveryDateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								<div class="form-group col-lg-3">
									<label><spring:message code="order.submitted.by.label" /></label>
									<input type="text" class="form-control" name="order_submitted_by" id="order_submitted_by" value="" required />
									<span id="orderSubmittedByError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								<div class="form-group col-lg-3">
									<label><spring:message code="order.approved.by.label" /></label>
									<input type="text" class="form-control" name="order_approved_by" id="order_approved_by" value="" required />
									<span id="orderApprovedByError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-lg-3">
									<label><spring:message code="warehouselocation.label" /></label>
									<!-- <input type="text" class="form-control" name="warehouse_location" id="warehouse_location" value="" required /> -->
									<select class="form-control" id="warehouse_location" name="warehouse_location" >
										<%-- <c:forEach var="location" items="${workLocationsList}">
											<option value="${location}">${location}</option>
										</c:forEach> --%>
										 <c:forEach var="location" items="${locationBeanList}">
<%-- 															<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}" >${location}</option> --%>
														<c:choose>
						                                      <c:when test="${location.description == ''}">
							                                   <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}</option>
							                                 </c:when>
							                                  <c:otherwise>
							                                  <option value="${location.locationId}" ${location.locationId == selectedLocation ? 'selected' : ''}>${location.locationId}-${location.description}</option>
							                                </c:otherwise>
							                              </c:choose>
														</c:forEach>
										
									</select>
								</div>
								<div class="form-group col-lg-3">
									<label><spring:message code="supplier.name.label" /></label>
									<input type="text" class="form-control searchItems" name="supplier_name" id="searchSupplier" />
									<div class=services>
								    		<div class="items">
								     			<ul class="matchedStringUl supplier" style="width: 89%!important;padding: 0px!important;"></ul>
								   			</div>
										</div>
									<span id="supplierNameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
								</div>
								<div class="form-group col-lg-3">
									<label><spring:message code="supplier.contact.name.label" /></label>
									<input type="text" class="form-control" name="supplier_contact_name" id="supplier_contact_name" value="" required />
									<span id="supplierContactNameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
									<input type="hidden" name="supplier_Id" id="supplier_Id" value=""  />
								</div>

								<div class="form-group col-lg-3">
									<label><spring:message code="shipment_mode.label" /></label> 
									<select class="form-control" name="shipping_mode" id="shipping_mode">
                                            <option value="Rail">Rail</option>
                                            <option value="Flight">Flight</option>
                                            <option value="Express">Express</option>
                                            <option value="Ordinary">Ordinary</option>
                                    </select>
									
								</div>
							</div>
							<div class="row">
								<div class="form-group col-lg-3">
									<label style="text-decoration: underline; font-size: 16px;font-weight:bold;"><spring:message
											code="shipmentAddress.label" /></label>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-lg-3" style="margin-top: -19px;">
									<label><spring:message code="doorNo.label" /></label> 
									<input type="text" class="form-control" name="shipping_address_doorNo" id="shipDno" value="" />
									<span id="shipDnoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
								</div>
								<div class="form-group col-lg-3" style="margin-top: -19px;">
									<label><spring:message code="shipment_street.label" /></label>
									<input type="text" class="form-control" name="shipping_address_street" id="shipStreet" value="" />
									<span id="shipStreetError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
								</div>
								<div class="form-group col-lg-3" style="margin-top: -19px;">
									<label><spring:message code="shipment_location.label" /></label>
									<input type="text" class="form-control" name="shipping_address_location" id="shipLoc" value="" />
									<span id="shipLocError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
								</div>
								<div class="form-group col-lg-3" style="margin-top: -19px;">
									<label><spring:message code="shipment_city.label" /></label> 
									<input type="text" class="form-control" name="shipping_address_city" id="shipCity" value="" />
									<span id="shipCityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-lg-6">
									<label><spring:message code="credit.terms.label" /></label>
									<textarea class="form-control" name="credit_terms" style="resize: none;" id="credit_terms" required></textarea>
								</div>
								<div class="form-group col-lg-6">
									<label><spring:message code="payment.terms.label" /></label>
									<textarea class="form-control" style="resize: none;" name="payment_terms"></textarea>
								</div>
								
							</div>
						
							<div class="row">
								<div class="form-group col-lg-6">
									<label><spring:message code="shipping.terms.label" /></label>
									<textarea  class="form-control" name="shipping_terms" style="resize: none;" ></textarea>
								</div>
								<div class="form-group col-lg-6">
									<label><spring:message code="remarks.label" /></label>
									<textarea  class="form-control" name="remarks" style="resize: none;" ></textarea>
								</div>
							</div>
							
							<div class="row">
								<div class="col-lg-3"></div>
								<div class="form-group col-lg-6">
									<label><spring:message code="search.items.here.label" /></label>
									<input type="text"  class="form-control searchItems" id="searchItems" />
										<div class="services">
								    		<div class="items">
								     			<ul class="matchedStringUl apparel" style=""></ul>
								   			</div>
										</div>
								</div>
								</div>

							<div class="table-responsive">
								<table id="productsList"
									class="table table-bordered table-hover">
									<thead style="background-color: #3c8dbc; color: #ffffff">
										<tr>
											<th><spring:message code="item.name.label" /></th>
											<th><spring:message code="item.desc.label" /></th>
											<th><spring:message code="price.label" /></th>
											<th><spring:message code="pack.label" /></th>
											<th><spring:message code="cost" /></th>
											<th><spring:message code="make.label" /></th>
											<th><spring:message code="model.label" /></th>
											<th><spring:message code="colour.label" /></th>
											<th><spring:message code="size.label" /></th>
											<th><spring:message code="action.label"/></th>
										</tr>
									</thead>
									<tbody>

									</tbody>
								</table>
							</div>
							<br>
							 <div class="row">
							 <input type="hidden" class="form-control" readonly="readonly" name="status" id="orderStatus"  value=""/> 
							 	<input type="hidden" name="warehouse" id="warehouse" value="${warehouse}" />
								<div class="col-lg-6"></div>
								<div class="form-group col-lg-3" style="text-align: right;"><label><spring:message code="shipping.cost.label" /> </label></div>
								<div class="form-group col-lg-3">
								<input type="text" class="form-control" id="shipping_cost" name="shipping_cost"  value=""/>
								<span id="shipCostError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
							</div>
							</div>
							<div class="row">
								<div class="col-lg-6"></div>
								<div class="form-group col-lg-3" style="text-align: right;"><label><spring:message code="total.tax.label" /> </label></div>
								<div class="form-group col-lg-3">
								<input type="text" class="form-control" id="total_tax" name="total_tax"  value=""/>
								<span id="totalTaxError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
							</div>
							</div>
							<div class="row">
								<div class="col-lg-6"></div>
								<div class="form-group col-lg-3" style="text-align: right;"><label><spring:message code="cost.label" /> </label></div>
								<div class="form-group col-lg-3">
								<input type="text" class="form-control" id="totalCost" name="total_po_value" readonly="readonly" value=""/>
							</div>
							</div>
						<br/>
						<input type="hidden" name="itemDetails" id="whPurchaseItems">
						<div class="row" style="text-align: right;">
							<input type="button" id="edit"  class="btn bg-olive btn-inline" onclick="validatePurchaseOrder('submitted','new');" value="<spring:message code="submit.label" />" />
							<input type="button" id="edit"  class="btn bg-olive btn-inline" style="margin-left:1%;width: 68px;" onclick="validatePurchaseOrder('draft','new');" value="<spring:message code="save.label" />" />
							<input type="button" class="btn bg-olive btn-inline" style="margin-left:1%;margin-right: 1%;" onclick="viewPurchaseOrder('all','purchaseOrder');" value="<spring:message code="cancel.label" />" />
						</div>
						<br/>
						<br />
						<div class="box-footer"></div>
						</div>
					</form>
				</div>

			</div>
		</div>
	</section>
	<!-- /.content -->
	<script type="text/javascript">
		$(function() {
			 $("#orderDate").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"}); 
             $("#deliveryDate").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
             
			/* $("#orderDate").inputmask("yyyy/mm/dd", {"placeholder": "yyyy/mm/dd"});
			$("#deliveryDate").inputmask("yyyy/mm/dd", {"placeholder": "yyyy/mm/dd"}); */
		});
	</script>
</body>
</html>