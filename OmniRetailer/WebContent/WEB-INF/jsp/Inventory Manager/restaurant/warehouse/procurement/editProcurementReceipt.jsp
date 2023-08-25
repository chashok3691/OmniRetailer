<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/warehouse/procurement/newProcurementReceipt.jsp
 * file type		        : JSP
 * description				: The new product is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/FBprocurement.js"></script>


<script type="text/javascript">
$(document).ready(function(){
	var supplierName = $("#supplier_id").val();
	$("#supplier_name").val(supplierName);
	$('#supplier_id').change(function () {
		 var supplierName = $("#supplier_id").val();
		 $("#supplier_name").val(supplierName);
	});
	/*  var date = getCurrentDate();
	 $('#date').val(date); */
    
	/* $("#searchCriteria").bind('input', function () {
	 var element = $(this);
	 var searchName = $(this).val();
	 $('#skuList option').each(function(index){
		 if($(this).val()==searchName){
			 getRawMaterialInfo();
		 }
	 });
	 
	 isAlphabet(element);
	 searchName = $(this).val();
	 if(searchName!=""&&searchName.length==3){
       	getRawMaterial(searchName);
       }
	}); */
	
	 $("#delivered_by").keydown(function(){
		   $("#deliveredByError").html("");
		   $("#Error").html("");
	 }); 
	 $("#inspected_by").keydown(function(){
		   $("#inspectedByError").html("");
		   $("#Error").html("");
	 }); 
 
});


</script>
</head>
<body>
<!-- Main content -->
<section class="content">
 <div class="row">
  <div class="col-lg-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center">
                                <br/>
                                <h3><spring:message code="procurement.edit.receipt.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form id="newProcurementReceipt" method="post" >
                                    <div class="box-body">
                                   	<div id="Error" style="text-align: center;color: red;font-size: 2;font-weight: bold;">${err}</div>
                                   	<div class="row">
                                   	 <div class="col-lg-4"></div>
                                   	  <div class="form-group col-lg-4">
                                   	  	<label><spring:message code="procurement.receipt.ref.label" /></label>
                                        <input type="text" class="form-control" readonly="readonly" name="receipt_ref_num" id="receipt_ref_num" value="${procurementReceipt.goods_receipt_ref_num}" required />
                                   	  </div>
                                   	   <div class="col-lg-4"></div>
                                   	</div>
                                   	<div class="row">
                                   		<div class="form-group col-lg-4">
                                   			<label><spring:message code="supplier.name.label" /></label>
                                           <!--  <input type="text" class="form-control" readonly="readonly" name="supplier_name" id="supplier_name" required /> -->
                                        	<input type="text" class="form-control searchItems" name="supplier_name" id="searchSupplier" value="${procurementReceipt.supplier_name}" />
											<div class=services>
									    		<div class="items">
									     			<ul class="matchedStringUl supplier" style="width: 89%!important;padding: 0px!important;"></ul>
									   			</div>
											</div>								
											<span id="supplierNameError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                                            <%-- <label><spring:message code="supplier.code.label" /></label>
                                             <select class="form-control" name="supplier_id" id="supplier_id">
                                              <c:forEach var="supplier" items="${supplierList}">
												<option value="${supplier.firmName}" ${supplier.firmName == procurementReceipt.supplier_name ? 'selected' : ''}>${supplier.supplierCode}</option>
											</c:forEach>
                                            </select> --%>
                                        </div>
                                     	<div class="form-group col-lg-4">
                                     		<label><spring:message code="supplier.code.label" /></label>
                                            <input type="text" class="form-control" readonly="readonly" name="supplier_id" id="supplier_Id" value="${procurementReceipt.supplier_id}"  />
                                           <%--  <label><spring:message code="supplier.name.label" /></label>
                                            <input type="text" class="form-control" readonly="readonly" name="supplier_name" id="supplier_name" value="${procurementReceipt.supplier_name}" required /> --%>
                                        </div>
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="procurement.location.label" /></label>
                                             <select class="form-control" name="location" id="warehouse_location">
                                             	<c:forEach var="location" items="${workLocationsList}">
													<option value="${location}" ${location == procurementReceipt.location ? 'selected' : ''}>${location}</option>
												</c:forEach>
                                            </select>
                                        </div>
									  </div>
                                      <div class="row">
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="delivered.by.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" name="delivered_by" id="delivered_by" required value="${procurementReceipt.delivered_by}" placeholder="<spring:message code="enter.delivered.by.label" />" />
                                            <span id="deliveredByError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                         <div class="form-group col-lg-4">
                                            <label><spring:message code="inspected.by.label" /> <span style="color:red; font-size:2">*</span></label>
                                            <input type="text" class="form-control" name="inspected_by" id="inspected_by" required value="${procurementReceipt.inspected_by}" placeholder="<spring:message code="enter.inspected.by.label" />"  />
                                            <span id="inspectedByError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                         </div>
                                         <div class="form-group col-lg-4">
                                            <label><spring:message code="shipment.note.label" /></label>
                                            <select class="form-control" name="shipment_note" id="shipment_note">
                                            <option value="SD123" ${'SD123' == procurementReceipt.shipment_note ? 'selected' : ''}>SD123</option>
                                            <option value="SD345" ${'SD345' == procurementReceipt.shipment_note ? 'selected' : ''}>SD345</option>
                                            <option value="SD678" ${'SD678' == procurementReceipt.shipment_note ? 'selected' : ''}>SD678</option>
                                            </select>
                                         </div>
                                         
                                        </div>
                                         <div class="row">
                                         <div class="form-group col-lg-4">
                                            <label><spring:message code="po.reference.label" /></label>
                                            <select class="form-control" name="po_reference" id="po_reference">
                                            <option value="PO123" ${'PO123' == procurementReceipt.po_reference ? 'selected' : ''}>PO123</option>
                                            <option value="PO345" ${'PO345' == procurementReceipt.po_reference ? 'selected' : ''}>PO345</option>
                                            <option value="PO678" ${'PO678' == procurementReceipt.po_reference ? 'selected' : ''}>PO678</option> 
                                            </select>
                                      	</div>
                                         <div class="form-group col-lg-4">
                                            <label><spring:message code="procurement.status.label" /></label>
                                             <select class="form-control" name="status" id="status">
                                            <option value="Received" ${'Received' == procurementReceipt.status ? 'selected' : ''}>Received</option>
                                            <option value="Rejected" ${'Rejected' == procurementReceipt.status ? 'selected' : ''}>Rejected</option>
                                            <option value="Partially Rejected" ${'Partially Rejected' == procurementReceipt.status ? 'selected' : ''}>Partially Rejected</option>
                                            <option value="Inspected" ${'Inspected' == procurementReceipt.status ? 'selected' : ''}>Inspected</option>
                                            <option value="Stored" ${'Stored' == procurementReceipt.status ? 'selected' : ''}>Stored</option>
                                            </select>
                                         </div>
                                         <div class="form-group col-lg-4">
                                            <label><spring:message code="date.label" /></label>
                                              <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input type="text" name="date" id="date" required value="${procurementReceipt.date}" class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/>
                                        </div> 
                                            
                                          <!--   <input type="text" readonly="readonly" class="form-control" name="date" id="date" /> -->
                                        </div>
                                         </div>
                                        
                                        <div class="row">
                                         <div class="col-lg-3"></div>
                                         <div class="form-group col-lg-6">
                                         	<label><spring:message code="search.items.here.label" /></label>
                                         	<input type="text"  class="form-control searchItems" id="searchItems" />
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl receipt" style=""></ul>
								   				</div>
											</div>
                                         	
                                        <!--     <input type="text" list="skuList" class="form-control"  name="searchCriteria" id="searchCriteria" />
 												<datalist id="skuList"></datalist> -->
  										 </div>
                                         <div class="col-lg-3"></div>
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
                                                <th><spring:message code="supplied.label"/></th>
                                                <th><spring:message code="received.label"/></th>
                                                <th><spring:message code="rejected.label"/></th>
                                                <th><spring:message code="action.label"/></th>
                                            </tr>
                                          </thead>
                                          <tbody>
                                            <c:forEach var="item" items="${procurementReceipt.items}" varStatus="theCount">
             		   						<%-- <tr id=dynamicdiv${fn:replace(item.item_code,' ','')}>
              									<td id=${fn:replace(item.item_code,' ','')}Name >${item.item_code}</td>
                  								<td id=${fn:replace(item.item_code,' ','')}Desc >${item.item_description}</td>
                  								<td class='Price' id=${fn:replace(item.item_code,' ','')}Price >${item.price}</td>
                  								<td class='Pack' onBlur='changePack(this);' contenteditable='true' id=${fn:replace(item.item_code,' ','')}Pack >${item.pack }</td>
                  								<td id=${fn:replace(item.item_code,' ','')}Cost >${item.cost}</td>
                  								<td id=${fn:replace(item.item_code,' ','')}Make >${item.make}</td>
                  								<td id=${fn:replace(item.item_code,' ','')}Supplied >${item.supplied }</td>
                  								<td class='Received' id=${fn:replace(item.item_code,' ','')}Received >${item.received}</td>
                  								<td onBlur='changeRejected(this);' contenteditable='true' id=${fn:replace(item.item_code,' ','')}Rejected >${item.reject}</td>
                  								<td id=${fn:replace(item.item_code,' ','')} ><img id=${fn:replace(item.item_code,' ','')} src='${pageContext.request.contextPath}/images/itemdelete.png' style='width:13%;height:13%;cursor:pointer;' onclick='deleteItem(this);' title='Delete ${item.item_code}'/></td>
                  	   						</tr> --%>
                  	   						<tr id=dynamicdiv${theCount.count}>
              									<td id="Name${theCount.count}" >${item.item_code}<input type="hidden" id="skuId${theCount.count}" value="${item.skuId}" /></td>
                  								<td id="Desc${theCount.count}" >${item.item_description}</td>
                  								<td class='Price' id="Price${theCount.count}" >${item.price}</td>
                  								<td class='Pack' onBlur='changePack(this);' contenteditable='true' id="Pack${theCount.count}" >${item.pack }</td>
                  								<td id="Cost${theCount.count}" >${item.cost}</td>
                  								<td id="Make${theCount.count}" >${item.make}</td>
                  								<td id="Supplied${theCount.count}" >${item.supplied }</td>
                  								<td class='Received' id="Received${theCount.count}" >${item.received}</td>
                  								<td onBlur='changeRejected(this);' contenteditable='true' id="Rejected${theCount.count}" >${item.reject}</td>
                  								<td id="Del${theCount.count}" ><img id="Img${theCount.count}" src='${pageContext.request.contextPath}/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' title='Delete ${item.item_code}'/></td>
                  	   						</tr>
              		   						</c:forEach> 
                						 </tbody>
                                       </table>
                                    </div>
                                     <div class="row">
                                         <!-- <div class="col-lg-3"></div> -->
                                         <div class="form-group  col-lg-12">
                                         	<label><spring:message code="remarks.label" /></label>
                                            <textarea class="form-control" name="remarks" id="remarks" rows="2" style="resize: none;" placeholder="<spring:message code="enter.remarks.label" />" >${procurementReceipt.remarks}</textarea>
 										 </div>
                                        <!--  <div class="col-lg-3"></div> -->
                                        </div>
                                         <div class="row">
                       						<div class="col-lg-4"></div>
                       						<div class="col-lg-4">
                        					<div class="form-group col-lg-6" >
                           						<label><spring:message code="totalquantity.label"/>: </label>
                           						<label id="totalQty">${procurementReceipt.receipt_total_qty}</label>
                        					</div>
                         					<div class="form-group col-lg-6">
                             					<label><spring:message code="cost.label"/>: </label>
                             					<label id="totalCost">${procurementReceipt.grand_total}</label>
                         					</div>
                         				</div>
                         				<div class="col-lg-4"></div>
                     				  </div>
                                      
                                    </div><!-- /.box-body -->
						 <div class="row" style="text-align: center;">
						 	<input type="button" class="btn bg-olive btn-inline" onclick="validateProcurementReceipt('submit')" value="<spring:message code="submit.label" />" />
							<input type="button" class="btn bg-olive btn-inline" onclick="validateProcurementReceipt('save')" style="margin-left:5%;" value="<spring:message code="save.label" />" />
							<input type="button" class="btn bg-olive btn-inline" onclick="return viewProcurement('draft','goodsReceipts');" style="margin-left:5%;" value="<spring:message code="cancel.label" />" />
						</div> 
				<br/>
                <div class="box-footer"></div>
               </form>
             </div>
           <%--   <input type="hidden" id="subCategories" value='${subCategories}'> --%> 
</div>
</div>
</section><!-- /.content -->
<script type="text/javascript">
		$(function() {
			 $("#date").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"}); 
		});
 </script>
</body>
</html>