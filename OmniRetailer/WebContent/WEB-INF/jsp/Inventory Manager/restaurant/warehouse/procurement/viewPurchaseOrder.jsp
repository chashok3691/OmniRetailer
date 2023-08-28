<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/warehouse/procurement/viewPurchaseOrder.jsp
 * file type		        : JSP
 * description				: The purchase order is displayed using this jsp
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/procurement.js"></script>


<script type="text/javascript">

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
            <br/>
            <h3>${purchaseOrderBeanObj.PO_Ref}<spring:message code="po.details.label" /></h3>
            </div><!-- /.box-header -->
            <!-- form start -->
            <form id="viewProcurementReceipt" method="post" >
                <div class="box-body">
                <div class="row" style="text-align: right; margin-top: -27px;">
				 	<div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
					<input type="button" class="btn bg-olive btn-inline" style="margin-left:1%;margin-right: 1%;position: relative;" onclick="viewPurchaseOrder('all','purchaseOrder');" value="<spring:message code="cancel.label" />" />
					<hr style="margin-top: 4px;width: 99%;" />
				</div>
                 
               	<div class="row">
               		<div class="form-group col-lg-3">
                        <label><spring:message code="order_date.label" /></label>
                         <input type="text" class="form-control" readonly="readonly" name="order_date" id="order_date" value="${purchaseOrderBeanObj.order_date}" required />
                    </div>
                 	<div class="form-group col-lg-3">
                        <label><spring:message code="delivery_date.label" /></label>
                        <input type="text" class="form-control" readonly="readonly" name="delivery_due_date" id="delivery_due_date" value="${purchaseOrderBeanObj.delivery_due_date}" required />
                    </div>
                    <div class="form-group col-lg-3">
                        <label><spring:message code="order.submitted.by.label" /></label>
                        <input type="text" class="form-control" readonly="readonly" name="order_submitted_by" id="order_submitted_by" value="${purchaseOrderBeanObj.order_submitted_by}" required />
                    </div>
                    <div class="form-group col-lg-3">
                        <label><spring:message code="order.approved.by.label" /></label>
                        <input type="text" class="form-control" readonly="readonly" name="order_approved_by" id="order_approved_by" value="${purchaseOrderBeanObj.order_approved_by}" required />
                     </div>
				</div>
                <div class="row">
                	 <div class="form-group col-lg-3">
                        <label><spring:message code="warehouselocation.label" /></label>
                        <input type="text" class="form-control" readonly="readonly" name="warehouse_location" id="warehouse_location" value="${purchaseOrderBeanObj.warehouse_location}" required />
                       
                     </div>
                     <div class="form-group col-lg-3">
                        <label><spring:message code="supplier.name.label" /></label>
                        <input type="text" class="form-control" readonly="readonly" value="${purchaseOrderBeanObj.supplier_name}" required />
                     </div>
                     <div class="form-group col-lg-3">
                        <label><spring:message code="supplier.contact.name.label" /></label>
                        <input type="text" class="form-control" readonly="readonly" name="supplier_contact_name" id="supplier_contact_name" value="${purchaseOrderBeanObj.supplier_contact_name}" required />
                       <input type="hidden" class="form-control" name="supplier_Id" id="supplier_Id" readonly="readonly" value="${purchaseOrderBeanObj.supplier_Id}"/>
                     </div>
                     <div class="form-group col-lg-3">
                       <label><spring:message code="shipment_mode.label" /></label>
                        <input type="text" class="form-control" readonly="readonly" name="shipping_mode" id="shipping_mode" value="${purchaseOrderBeanObj.shipping_mode}" required />
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
	                    <input type="text" class="form-control" readonly name="shipping_address_doorNo" value="${purchaseOrderBeanObj.shipping_address_doorNo}"/>
	            	</div>
	            	<div class="form-group col-lg-3" style="margin-top: -19px;">
	                    <label><spring:message code="shipment_street.label" /></label>
	                    <input type="text" class="form-control" readonly name="shipping_address_street" value="${purchaseOrderBeanObj.shipping_address_street}"/>
	             	</div>
	              	<div class="form-group col-lg-3" style="margin-top: -19px;">
	                    <label><spring:message code="shipment_location.label" /></label>
	                    <input type="text" class="form-control" readonly name="shipping_address_location" value="${purchaseOrderBeanObj.shipping_address_location}"/>
	             	</div>
	               	<div class="form-group col-lg-3" style="margin-top: -19px;">
	                    <label><spring:message code="shipment_city.label" /></label>
	                    <input type="text" class="form-control" readonly name="shipping_address_city" value="${purchaseOrderBeanObj.shipping_address_city}"/>
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
                        <textarea class="form-control" readonly="readonly" name="credit_terms" style="resize: none;" id="credit_terms" required >${purchaseOrderBeanObj.credit_terms}</textarea>
                    </div>
                     <div class="form-group col-lg-6">
                        <label><spring:message code="payment.terms.label" /></label>
                        <textarea readonly="readonly" class="form-control" style="resize: none;" name="payment_terms">${purchaseOrderBeanObj.payment_terms}</textarea>
                    </div>
                 </div>
                    
                    <div class="row">
						<div class="form-group col-lg-6">
							<label><spring:message code="shipping.terms.label" /></label>
							<textarea  class="form-control" readonly="readonly" name="shipping_terms" style="resize: none;" >${purchaseOrderBeanObj.shipping_terms}</textarea>
						</div>
						<div class="form-group col-lg-6">
							<label><spring:message code="remarks.label" /></label>
							<textarea  class="form-control" readonly="readonly" name="remarks" style="resize: none;" >${purchaseOrderBeanObj.remarks}</textarea>
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
                        </tr>
                      </thead>
                      <tbody>
                       <c:forEach var="item" items="${purchaseOrderBeanObj.whPurchaseItems}">
             		   <tr>
              			<td>${item.itemId}</td>
                  		<td>${item.itemDesc}</td>
                  		<td>${item.itemPrice}</td>
                  		<td>${item.quantity }</td>
                  		<td>${item.totalCost}</td>
                  		<td>${item.make}</td>
                  		<td>${item.model }</td>
                  		<td>${item.color}</td>
                  		<td>${item.size}</td>
                  	   </tr>
              		   </c:forEach> 
		 </tbody>
                   </table>
                </div>
                  <br>
                  <div class="row">
					 <input type="hidden" class="form-control" readonly="readonly" name="status" id="orderStatus"  value=""/> 
						<div class="col-lg-6"></div>
						<div class="form-group col-lg-3" style="text-align: right;"><label><spring:message code="shipping.cost.label" /> </label></div>
						<div class="form-group col-lg-3">
						<input type="text" class="form-control" id="shipping_cost" name="shipping_cost" readonly="readonly" value="${purchaseOrderBeanObj.shipping_cost}"/>
						<span id="shipCostError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
					</div>
					</div>
					<div class="row">
						<div class="col-lg-6"></div>
						<div class="form-group col-lg-3" style="text-align: right;"><label><spring:message code="total.tax.label" /> </label></div>
						<div class="form-group col-lg-3">
						<input type="text" class="form-control" id="total_tax" readonly="readonly" name="total_tax"  value="${purchaseOrderBeanObj.total_tax}"/>
						<span id="totalTaxError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
					</div>
					</div>
					<div class="row">
						<div class="col-lg-6"></div>
						<div class="form-group col-lg-3" style="text-align: right;"><label><spring:message code="cost.label" /> </label></div>
						<div class="form-group col-lg-3">
						<input type="text" class="form-control" id="totalCost" name="total_po_value" readonly="readonly" value="${purchaseOrderBeanObj.total_po_value}"/>
					</div>
					
					<%-- 		
                      <div class="row">
                       	<div class="col-lg-4"></div>
                        <div class="col-lg-4" style="text-align: center;"></div>
                        <div class="col-lg-4" style="text-align: right;padding-right: 2%"> <label><spring:message code="cost.label"/>: </label>
                             <label id="totalCost">${purchaseOrderBeanObj.total_po_value}</label>
                        </div>
                     </div> --%>
                </div><!-- /.box-body -->
			  <div class="row" style="text-align: right;">
			<input type="button" class="btn bg-olive btn-inline" style="margin-left:1%;margin-right: 1%;" onclick="viewPurchaseOrder('all','purchaseOrder');" value="<spring:message code="cancel.label" />" />
			</div>  
		<br/>
        <div class="box-footer"></div>
        </div>
     </form>
   </div>
     
</div>
</div>
</section><!-- /.content -->

</body>
</html>