<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/warehouse/procurement/editPurchaseOrder.jsp
 * file type		        : JSP
 * description				: The purchase order is displayed using this jsp and allows modify and save
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
 	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/FBprocurement.js"></script>


</head>
<body>
<!-- Content Header (Page header) -->

<!-- Main content -->
<section class="content">
 <div class="row">
  <div class="col-lg-12">
				<div class="box box-primary">
            <div class="box-header" style="text-align: center">
            <br/>
            <h3>${purchaseOrderBeanObj.PO_Ref}<spring:message code="po.details.label" /></h3>
            </div><!-- /.box-header -->
            <!-- form start -->
            <form id="viewProcurementReceipt" method="post" >
                <div class="box-body">
                <div class="row" style="text-align: right; margin-top: -27px;">
				 	<div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
				 	<input type="button" id="edit" style="position: relative;" class="btn bg-olive btn-inline" onclick="validatePurchaseOrder('submitted','edit');" value="<spring:message code="submit.label" />" />
					<input type="button" id="edit"  class="btn bg-olive btn-inline" style="margin-left:1%;width: 68px;position: relative;" onclick="validatePurchaseOrder('draft','edit');" value="<spring:message code="save.label" />" />
					<input type="button" class="btn bg-olive btn-inline" style="margin-left:1%;margin-right: 1%;position: relative;" onclick="viewPurchaseOrder('${purchaseOrderBeanObj.status}','purchaseOrder');" value="<spring:message code="cancel.label" />" />
					<hr style="margin-top: 4px;width: 99%;" />
				</div>
                 
               	<div class="row">
               		<div class="form-group col-lg-3">
                        <label><spring:message code="order_date.label" /></label>
                        <input type="hidden" name="pO_Ref" value="${purchaseOrderBeanObj.PO_Ref}">
                       	<%-- <input type="text" id="orderDate" name="order_date" readonly="readonly" class="form-control" value="${purchaseOrderBeanObj.order_date}"> --%>
                         <div class="input-group">
							<div class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</div>
							<input type="text" id="orderDate" name="order_date" required value="${purchaseOrderBeanObj.order_date}" class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask />
						</div>
						<!-- /.input group -->
                     	<span id="orderDateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>    
                    </div>
                 	<div class="form-group col-lg-3">
                        <label><spring:message code="delivery_date.label" /></label>
                        <div class="input-group">
							<div class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</div>
							<input type="text" name="delivery_due_date" id="deliveryDate" required value="${purchaseOrderBeanObj.delivery_due_date}" class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask />
						</div>
						<!-- /.input group -->
						<span id="deliveryDateError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                    </div>
                    <div class="form-group col-lg-3">
                        <label><spring:message code="order.submitted.by.label" /></label>
                        <input type="text" class="form-control" name="order_submitted_by" id="order_submitted_by" value="${purchaseOrderBeanObj.order_submitted_by}" required />
                        <span id="orderSubmittedByError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                    </div>
                    <div class="form-group col-lg-3">
                        <label><spring:message code="order.approved.by.label" /></label>
                        <input type="text" class="form-control" name="order_approved_by" id="order_approved_by" value="${purchaseOrderBeanObj.order_approved_by}" required />
                        <span id="orderApprovedByError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                     </div>
				</div>
                <div class="row">
                	 <div class="form-group col-lg-3">
                        <label><spring:message code="warehouselocation.label" /></label>
                        <select class="form-control" id="warehouse_location" name="warehouse_location" >
							<c:forEach var="location" items="${workLocationsList}">
								<option value="${location}" ${location == purchaseOrderBeanObj.warehouse_location ? 'selected' : ''}>${location}</option>
							</c:forEach>
						</select>
                     </div>
                     <div class="form-group col-lg-3">
                        <label><spring:message code="supplier.name.label" /></label>
                        <input type="text"  class="form-control searchItems" name="supplier_name" id="searchSupplier" value="${purchaseOrderBeanObj.supplier_name}" />
						<!-- <datalist id="supplierList"></datalist> -->
						<div class="services">
				    		<div class="items">
				     			<ul class="matchedStringUl supplier" style="width: 89%!important;padding: 0px!important;"></ul>
				   			</div>
						</div>
						<span id="supplierNameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                     </div>
                     <div class="form-group col-lg-3">
                        <label><spring:message code="supplier.contact.name.label" /></label>
                        <input type="text" class="form-control" name="supplier_contact_name" id="supplier_contact_name" value="${purchaseOrderBeanObj.supplier_contact_name}" required />
                       <input type="hidden" class="form-control" name="supplier_Id" id="supplier_Id" readonly="readonly" value="${purchaseOrderBeanObj.supplier_Id}"/>
                     </div>
                     <div class="form-group col-lg-3">
                       <label><spring:message code="shipment_mode.label" /></label>
                     	<select class="form-control" name="shipping_mode" id="shipping_mode">
                           <option value="Rail" ${'Rail' == purchaseOrderBeanObj.shipping_mode ? 'selected' : ''}>Rail</option>
                           <option value="Flight" ${'Flight' == purchaseOrderBeanObj.shipping_mode ? 'selected' : ''}>Flight</option>
                           <option value="Express" ${'Express' == purchaseOrderBeanObj.shipping_mode ? 'selected' : ''}>Express</option>
                           <option value="Ordinary" ${'Ordinary' == purchaseOrderBeanObj.shipping_mode ? 'selected' : ''}>Ordinary</option>
                        </select>
                     </div>
              	</div>
              	<div class="row">
	            	<div class="form-group col-lg-3">
	                    <label style="text-decoration: underline; font-size: 16px;font-weight:bold;"><spring:message code="shipmentAddress.label" /></label>
	             	</div>
	             </div>
	             <div class="row">
	            	<div class="form-group col-lg-3" style="margin-top: -19px;">
  						<label><spring:message code="doorNo.label" /></label> 
						<input type="text" class="form-control" name="shipping_address_doorNo" id="shipDno" value="${purchaseOrderBeanObj.shipping_address_doorNo}" />
						<span id="shipDnoError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
					</div>
					<div class="form-group col-lg-3" style="margin-top: -19px;">
						<label><spring:message code="shipment_street.label" /></label>
						<input type="text" class="form-control" name="shipping_address_street" id="shipStreet" value="${purchaseOrderBeanObj.shipping_address_street}" />
						<span id="shipStreetError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
					</div>
					<div class="form-group col-lg-3" style="margin-top: -19px;">
						<label><spring:message code="shipment_location.label" /></label>
						<input type="text" class="form-control" name="shipping_address_location" id="shipLoc" value="${purchaseOrderBeanObj.shipping_address_location}" />
						<span id="shipLocError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
					</div>
					<div class="form-group col-lg-3" style="margin-top: -19px;">
						<label><spring:message code="shipment_city.label" /></label> 
						<input type="text" class="form-control" name="shipping_address_city" id="shipCity" value="${purchaseOrderBeanObj.shipping_address_city}" />
						<span id="shipCityError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
					</div>
	              </div>
                <%--  <div class="row">
                     <div class="form-group col-lg-3">
                        <label><spring:message code="shipment_mode.label" /></label>
                        <input type="text" class="form-control" readonly="readonly" name="shipping_mode" id="shipping_mode" value="${purchaseOrderBeanObj.shipping_mode}" required />
                    </div>
                     <div class="form-group col-lg-3">
                        <label><spring:message code="shipping.cost.label" /></label>
                         <input type="text" class="form-control" readonly="readonly" name="shipping_cost" id="shipping_cost" value="${purchaseOrderBeanObj.shipping_cost}" required />
                     </div>
                     <div class="form-group col-lg-6">
                        <label><spring:message code="shipping.terms.label" /></label>
                        <input type="text" readonly="readonly" class="form-control" name="shipping_terms" value="${purchaseOrderBeanObj.shipping_terms}" />
                    </div>
                 </div> --%>
                  <div class="row">
                     <div class="form-group col-lg-6">
                        <label><spring:message code="credit.terms.label" /></label>
                        <textarea class="form-control" name="credit_terms" style="resize: none;" id="credit_terms" required >${purchaseOrderBeanObj.credit_terms}</textarea>
                    </div>
                     <div class="form-group col-lg-6">
                        <label><spring:message code="payment.terms.label" /></label>
                        <textarea class="form-control" style="resize: none;" name="payment_terms">${purchaseOrderBeanObj.payment_terms}</textarea>
                    </div>
                 </div>
                    
                    <div class="row">
						<div class="form-group col-lg-6">
							<label><spring:message code="shipping.terms.label" /></label>
							<textarea  class="form-control" name="shipping_terms" style="resize: none;" >${purchaseOrderBeanObj.shipping_terms}</textarea>
						</div>
						<div class="form-group col-lg-6">
							<label><spring:message code="remarks.label" /></label>
							<textarea  class="form-control" name="remarks" style="resize: none;" >${purchaseOrderBeanObj.remarks}</textarea>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-3"></div>
						<div class="form-group col-lg-6">
							<label><spring:message code="search.items.here.label" /></label>
							<input type="text"  class="form-control searchItems" id="searchItems" />
								<!-- <datalist id="skuList"></datalist> -->
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
                      <tbody>
                 <!--      
                       var row = "<tr id='dynamicdiv"+len+"' style='margin-top:5px;'><td id='itemId"+len+"'>"+parsedJson.productName+"" +
			 		"<input type='hidden' id='skuId"+len+"' value='"+parsedJson.skuId+"'/></td>" +
		 		"<td id='itemDesc"+len+"'>"+parsedJson.description+"</td><td class='Price' id='itemPrice"+len+"'>"+parsedJson.price+"</td>" +
		 		"<td id='quantity"+len+"' class='Pack' onBlur='changeOrderedPack(this);' contenteditable='true'>1</td><td class='cost' id='totalCost"+len+"'>"+parsedJson.price+"</td>" +
		 		"<td id='make"+len+"'>"+parsedJson.make+"</td><td id='model"+len+"'>"+parsedJson.modelNumber+"</td><td id='color"+len+"'>"+parsedJson.color+"</td>" +
		 		"<td id='size"+len+"'>"+parsedJson.size+"</td><td id='Del"+ len +"' ><img id='Img"+ len +"' src='"+contextPath+"/images/itemdelete.png' style='width:35px;cursor:pointer;' onclick='deleteItemDetails(this);' title='Delete "+parsedJson.productName+"'/>" +
		 		"</td></tr>";
                       -->
	                       <c:forEach var="item" items="${purchaseOrderBeanObj.whPurchaseItems}" varStatus="theCount">
		             		   <tr id="dynamicdiv${theCount.count}">
			              			<td id="itemId${theCount.count}">${item.itemId}<input type="hidden" id="skuId${theCount.count}" value="${item.skuId}" /></td>
			                  		<td id="itemDesc${theCount.count}">${item.itemDesc}</td>
			                  		<td id="itemPrice${theCount.count}" class="Price">${item.itemPrice}</td>
			                  		<td id="quantity${theCount.count}" class="Pack">${item.quantity }</td>
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
                  <input type="hidden" name="itemDetails" id="whPurchaseItems">
					 <input type="hidden" class="form-control" readonly="readonly" name="status" id="orderStatus"  value="${purchaseOrderBeanObj.status}"/> 
						<div class="col-lg-6"></div>
						<div class="form-group col-lg-3" style="text-align: right;"><label><spring:message code="shipping.cost.label" /> </label></div>
						<div class="form-group col-lg-3">
						<input type="text" class="form-control" id="shipping_cost" name="shipping_cost" value="${purchaseOrderBeanObj.shipping_cost}"/>
						<span id="shipCostError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
					</div>
					</div>
					<div class="row">
						<div class="col-lg-6"></div>
						<div class="form-group col-lg-3" style="text-align: right;"><label><spring:message code="total.tax.label" /> </label></div>
						<div class="form-group col-lg-3">
						<input type="text" class="form-control" id="total_tax" name="total_tax"  value="${purchaseOrderBeanObj.total_tax}"/>
						<span id="totalTaxError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
					</div>
					</div>
					<div class="row">
						<div class="col-lg-6"></div>
						<div class="form-group col-lg-3" style="text-align: right;"><label><spring:message code="cost.label" /> </label></div>
						<div class="form-group col-lg-3">
						<input type="text" class="form-control" id="totalCost" name="total_po_value" readonly="readonly" value="${purchaseOrderBeanObj.total_po_value}"/>
					</div>
				
                </div><!-- /.box-body -->
			  <div class="row" style="text-align: right;">
				  <input type="button" id="edit"  class="btn bg-olive btn-inline" onclick="validatePurchaseOrder('submitted','edit');" value="<spring:message code="submit.label" />" />
				<input type="button" id="edit"  class="btn bg-olive btn-inline" style="margin-left:1%;width: 68px;" onclick="validatePurchaseOrder('draft','edit');" value="<spring:message code="save.label" />" />
				<input type="button" class="btn bg-olive btn-inline" style="margin-left:1%;margin-right: 1%;" onclick="viewPurchaseOrder('${purchaseOrderBeanObj.status}','purchaseOrder');" value="<spring:message code="cancel.label" />" />
			</div>  
		<br/>
        <div class="box-footer"></div>
        </div>
     </form>
   </div>
     
</div>
</div>
</section><!-- /.content -->
<script type="text/javascript">
		$(function() {
			//Datemask dd/mm/yyyy
			/* $("#orderDate").inputmask("dd/mm/yyyy", {
				"placeholder" : "dd/mm/yyyy"
			}); */
			 $("#orderDate").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"}); 
            $("#deliveryDate").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
			
			/* $("#orderDate").inputmask("yyyy/mm/dd", {"placeholder": "yyyy/mm/dd"}); 
			$("#deliveryDate").inputmask("yyyy/mm/dd", {"placeholder": "yyyy/mm/dd"}); */
			/* $("#deliveryDate").inputmask("dd/mm/yyyy", {
				"placeholder" : "dd/mm/yyyy"
			}); */
		});
	</script>
</body>
</html>