<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/warehouse/goodsTransfer/editstockreceipt.jsp
 * file type		        : JSP
 * description				: The new store form is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/goodstransfer.js"></script>
<script>
$(document).ready(function(){
	$('.dataTables_empty').remove();
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
                                <div class="box-header" style="text-align: center">
                                <br/>
                                <h3><spring:message code="edit.stockreceipt.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form role="form">
                                    <div class="box-body">
                                     <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                    <div class="row">
                                    
                                       <div class="form-group col-lg-4">
                                            <label><spring:message code="shipped.from.label" /></label>
                                             <select class="form-control" name="shipped_from" id="fromlocation">
                                             <c:forEach var="location" items="${locationsList}">
												<option value="${location}" ${location == stockReceiptDetails.shipped_from ? 'selected' : ''}>${location}</option>
											</c:forEach>
                                           </select>
                                        </div>
                                        
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="date.label" /></label>
                                             <div class="input-group">
	                                            <div class="input-group-addon">
	                                                <i class="fa fa-calendar"></i>
	                                            </div>
	                                            <input type="text" name="deliveryDate" id="date" required value="${stockReceiptDetails.deliveryDate}" class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/>
	                                        </div> <!-- /.input group -->
                                            <!-- <input type="text" class="form-control" name="deliveryDate" id="date" readonly /> -->
                                        </div>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="receiptlocation.label" /></label>
                                             <select class="form-control" name="receipt_location" id="tolocation">
                                             <c:forEach var="location" items="${locationsList}">
												<option value="${location}" ${location == stockReceiptDetails.receipt_location ? 'selected' : ''}>${location}</option>
											</c:forEach>
                                           </select>
                                        </div>
                                        </div>
                                        
                                          
                                    <div class="row">
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="delivered.by.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" name="delivered_by" id="delivered" placeholder='<spring:message code="enter.name.label"/>' value="${stockReceiptDetails.delivered_by}"/>
                                            <span id="deliveredByError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="inspected.label" /> <spring:message code="by.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" name="InspectedBy" id="inspected" placeholder='<spring:message code="enter.name.label"/>' value="${stockReceiptDetails.inspected_By}"/>
                                            <span id="inspectedByError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        
                                        <div class="form-group col-lg-4">
                                            <label><spring:message code="received.label" /> <spring:message code="by.label" /> <span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" id="received" name="Received_by" placeholder='<spring:message code="enter.name.label"/>' value="${stockReceiptDetails.receivedBy}"/>
                                            <span id="receivedByError" style="text-align:right;color:red;font-weight:bold;"></span>
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
                                         	
                                            <%-- <input type="text" list="skuList" class="form-control"  name="searchCriteria" id="searchCriteria" placeholder="<spring:message code="good.label"/>" />
 												<datalist id="skuList">
												
												</datalist> --%>
  										 </div>
                                         <div class="col-lg-3"></div>
                                        </div>
                                        
                                        <br>
                                     
                                      <div class="table-responsive">
                                        <table id="productsList" class="table table-bordered table-hover">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><spring:message code="item.name.label"/></th>
                                                <th><spring:message code="item.desc.label"/></th>
                                                <th><spring:message code="uom.label"/></th>
                                                <th><spring:message code="price.label"/></th>
                                                <th><spring:message code="pack.label"/></th>
                                                <th><spring:message code="cost"/></th>
                                                <th><spring:message code="supplied.label"/></th>
                                                <th><spring:message code="received.label"/></th>
                                                <th><spring:message code="rejected.label"/></th>
                                                <th><spring:message code="action.label"/></th>
                                            </tr>
                                          </thead>
                                          <tbody>
                                             <c:forEach var="item" items="${stockReceiptDetails.reciptDetails}" varStatus="theCount">
                                             <tr id=dynamicdiv${theCount.count}>
              									<td id="Name${theCount.count}" >${item.item}<input type="hidden" id="skuId${theCount.count}" value="${item.skuId}" /></td>
                  								<td id="Desc${theCount.count}" >${item.description}</td>
                  								<td id="UOM${theCount.count}" >${item.uOM}</td>
                  								<td class='Price' id="Price${theCount.count}" >${item.price}</td>
                  								<td class='Pack' onBlur='changePack(this);' contenteditable='true' id="Pack${theCount.count}" >${item.quantity }</td>
                  								<td id="Cost${theCount.count}" >${item.cost}</td>
                  								<td id="Supplied${theCount.count}" >${item.supplied }</td>
                  								<td class='Received' id="Received${theCount.count}" >${item.recieved}</td>
                  								<td onBlur='changeRejected(this);' contenteditable='true' id="Rejected${theCount.count}" >${item.rejected}</td>
                  								<td id="Del${theCount.count}" ><img id="Img${theCount.count}" src='${pageContext.request.contextPath}/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' title='Delete ${item.item}'/></td>
                  	   						</tr>
                  	   						
             		   						<%--   <tr id=dynamicdiv${fn:replace(itemList.item,' ','')}>
              									<td id=${fn:replace(itemList.item,' ','')}Name >${itemList.item}</td>
                  								<td id=${fn:replace(itemList.description,' ','')}Desc >${itemList.description}</td>
                  								<td id=${fn:replace(itemList.item,' ','')}UOM >${itemList.uOM}</td>
                  								<td class='Price' id=${fn:replace(itemList.item,' ','')}Price >${itemList.price}</td>
                  								<td class='Pack' onBlur='changePack(this);' contenteditable='true' id=${fn:replace(itemList.item,' ','')}Pack >${itemList.quantity}</td>
                  								<td id=${fn:replace(itemList.item,' ','')}Cost >${itemList.cost}</td>
                  								<td id=${fn:replace(itemList.item,' ','')}Supplied >${itemList.supplied }</td>
                  								<td class='Received' id=${fn:replace(itemList.item,' ','')}Received >${itemList.recieved}</td>
                  								<td onBlur='changeRejected(this);' contenteditable='true' id=${fn:replace(itemList.item,' ','')}Rejected >${itemList.rejected}</td>
                  								<td id=${fn:replace(itemList.item,' ','')} ><img id=${fn:replace(itemList.item,' ','')} src='${pageContext.request.contextPath}/images/itemdelete.png' style='width:13%;height:13%;cursor:pointer;' onclick='deleteItem(this);' title='Delete ${itemList.item}'/></td>
                  	   						</tr> --%>
              		   						</c:forEach> 
                                            
                                          </tbody>
                                       </table>
                                    </div>
                                
                                    <br/> <br/>
                                    
                                     <div class="row">
                                        
                                         <div class="form-group  col-lg-12">
                                         	<label><spring:message code="remarks.label" /></label>
                                            <textarea class="form-control" name="remarks" id="remarks" rows="2" style="resize: none;" placeholder="<spring:message code="enter.remarks.label" />" >${stockReceiptDetails.remarks}</textarea>
 										 </div>
                                        <!--  <div class="col-lg-3"></div> -->
                                        </div>
                                        <br/>
                                   
                                        
                                      <div class="row">
								<div class="col-lg-4"></div>
								<div class="col-lg-4">
									<div class="form-group col-lg-6">
										<label><spring:message code="totalquantity.label" />:
										</label> <label id="totalQty">${stockReceiptDetails.receipt_total_qty}</label>
									</div>
									<div class="form-group col-lg-6">
										<label><spring:message code="cost.label" />: </label> <label
											id="totalCost">${stockReceiptDetails.receipt_total}</label>
									</div>
								</div>
								<div class="col-lg-4"></div>
							</div>
                                  
                                       
                                        
                                       
                                    </div><!-- /.box-body -->
									
						<div class="row" style="text-align: center;">
						 <input type="button" class="btn bg-olive btn-inline" onclick="validateWarehouseStockReceipt('stored','update','${stockReceiptDetails.goods_receipt_ref_num}','${stockReceiptDetails.id_goods_receipt}');" value="Submit" />
						<input type="button" class="btn bg-olive btn-inline" style="margin-left:5%;" onclick="validateWarehouseStockReceipt('draft','update','${stockReceiptDetails.goods_receipt_ref_num}','${stockReceiptDetails.id_goods_receipt}');" value="<spring:message code="save.label" />" />
						<input type="button" class="btn bg-olive btn-inline" style="margin-left:5%;" onclick="viewWarehouseGoodsTransfers('warehouseGoodstransfer','all');" value="<spring:message code="cancel.label" />" />
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
<!-- DATA TABES SCRIPT -->
      	<script type="text/javascript">
		$(function() {
			 $("#date").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"}); 
		});
	</script> 
       
</body>
</html>
		    		 