<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/retailoutlets/viewstockreceipt.jsp
 * file type		        : JSP
 * description				: The new store form is displayed using this jsp
 * edited by				: G vasudeva Reddy on 24/09/2019
 * edit						: added skuid to sku table
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
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/goodstransfer.js"></script>
<style>
	#overflowtext{

width : 250px;
overflow: hidden;
text-overflow: ellipsis;
 text-align: left;
white-space: nowrap;
}
  .odd{display:none!important;}
</style>
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
                                <h3><spring:message code="view.stockreceipt.label" /></h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form role="form">
                                    <div class="box-body">
                                     <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                    <div class="row">
                                    <div class="form-group col-lg-2">
                                            <label><spring:message code="location.label" /></label>
                                            <select class="form-control" disabled="disabled" name="receipt_location" id="tolocation">
												<option value="${stockReceiptDetails.receipt_location}">${stockReceiptDetails.receipt_location}</option>
                                           </select>
                                            <input type="hidden" id="toLocation">
                                        </div>
                                         <div class="form-group col-lg-1"></div>
                                    <input type="hidden" id="requestRef" value="${stockReceiptDetails.requestId}">
                                   		 <div class="form-group col-lg-3">
                                    		<label><spring:message code="goodsissueref.label" /></label>
                                           <%--  <input type="text" class="form-control allField searchItems" value="${stockReceiptDetails.issueReferenceNo}" style="height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" name="searchIssue" id="searchIssue" placeholder="<spring:message code="goodsissueref.label" />" />
											<div class=services>
										    		<div class="items">
										     			<ul class="matchedStringUl searchIssue" style="width: 89%!important;padding: 0px!important;"></ul>
										   			</div>
												</div> --%>
											<input type="text" name="issueRef" readonly="readonly" class="form-control" id="issueRef" value="${stockReceiptDetails.issueReferenceNo}"  />
											<span id="Error" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
                                    	</div>
                                        <div class="form-group col-lg-2">
                                            <label><spring:message code="delivery_date.label" /></label>
                                            <input type="text" class="form-control" name="deliveryDate" id="date" readonly value="${stockReceiptDetails.deliveryDate}"/>
                                        </div>
                                        <div class="form-group col-lg-1"></div>
	                                    <div class="form-group col-lg-2">
	                                            <label><spring:message code="shipped.from.label" /></label>
	                                             <select class="form-control" disabled="disabled" name="shipped_from" id="fromLocation">
													<option value="${stockReceiptDetails.shipped_from}">${stockReceiptDetails.shipped_from}</option>
	                                           </select>
	                                     </div>
                                        </div>
                                    <div class="row">
                                    	<div class="form-group col-lg-2">
                                            <label><spring:message code="date.label" /></label>
	                                        <input class="form-control calendar_icon" value="${stockReceiptDetails.createdDateStr}" readonly="readonly" name="createdDate" id="createdDate" size="20" type="text" />
                                        </div>
                                        <div class="form-group col-lg-1"></div>
                                          <div class="form-group col-lg-2">
                                            <label><spring:message code="stockreceipt.shippmentref.label" /> </label>
                                            <input type="text" class="form-control" readonly name="delivered_by" id="shippmentRef" value="${stockReceiptDetails.shipmentRefNo}" placeholder='<spring:message code="enter.name.label"/>'/>
                                            <span id="shippmentRefError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        
                                               <div class="form-group col-lg-1"></div>
                                        
                                        <div class="form-group col-lg-2">
                                            <label><spring:message code="inspected.label" /> <spring:message code="by.label" /></label>
                                            <input type="text" class="form-control" name="InspectedBy" id="inspected" readonly value="${stockReceiptDetails.inspectedBy}"/>
                                        </div>
                                               <div class="form-group col-lg-1"></div>
                                        <div class="form-group col-lg-2">
                                            <label><spring:message code="delivered.by.label" /></label>
                                            <input type="text" class="form-control" name="delivered_by" id="delivered" readonly value="${stockReceiptDetails.delivered_by}"/>
                                        </div>
                                       
                                     </div>
                                    <div class="row">
                                    
                                    <input type="hidden" id="requestRef" value="">
                                      <div class="form-group col-lg-3">
                                         <label>Stock Return Ref</label>
                                            <input type="text"  onblur="criteria(this)" class="form-control allField searchItems searchBar" value="" style="" name="searchReturn" id="searchReturn" placeholder="Stock Return" />
											<div class=services>
										    		<div class="items">
										     			<ul class="matchedStringUl searchReturn" style="width: 89%!important;padding: 0px!important;"></ul>
										   			</div>
												</div>
											<span id="searchIssueError" style="text-align: right; color: red; font-size: 2; font-weight: bold;"></span>
											<input type="hidden" name="ReturnRef" id="ReturnRef" value=""  />   
                                           
                                            
                                        </div>
                                         <div class="form-group col-lg-2">
                                            <label><spring:message code="stockreceipt.issuedby.label" /> </label>
                                            <input type="text" class="form-control" readonly name="issuedBy" id="issuedBy" placeholder='' value="${stockReceiptDetails.issuedBy}"/>
                                            <span id="issuedByError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                               <div class="form-group col-lg-1"></div>
                                         <div class="form-group col-lg-2">
                                            <label><spring:message code="received.label" /> <spring:message code="by.label" /> </label>
                                            <input type="text" class="form-control" id="received" name="Received_by" readonly value="${stockReceiptDetails.received_by}"/>
                                        </div>
                                       
                                               <div class="form-group col-lg-1"></div>
                                        <div class="form-group col-lg-2">
                                            <label><spring:message code="stockreceipt.shippmentmode.label" /> </label>
                                             <select class="form-control" readonly name="shippmentMode" id="shippmentMode" >
												<option value="Road" ${location == selectedLocation ? 'selected' : ''} >${stockReceiptDetails.shipmentMode}</option>
                                           </select>
                                            <span id="receivedByError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                     </div>
                                     <br>
                                        <div class="col-lg-12" style="background: #eee;padding: 10px 0px 10px 0px;margin-bottom: 30px;">
      									<div class="col-lg-9">
      									
      									<div class="col-lg-9" style="padding-left: 0px;    padding-top: 5px;">
      									  <c:forEach var="previousWorkFlowList" items="${stockReceiptDetails.previousStates}">
      									  <div class="p" style="display:inline-block;"></div>
                                             <span class=" border" style="padding-left: 0px;padding-top: 17px;font-size: 16px;"><img alt="" style="height:30px" src="${pageContext.request.contextPath}/images/workflow_arrow.png">${previousWorkFlowList}
      									
      									</span>
      									
                                             </c:forEach></div>
      									</div>
      									<div class="col-lg-2" style="padding-right: 0px;">
      							
      									
      									</div>
      									<div class="col-lg-1"></div>
      									</div>
                                     <br>
                                      <div class="table-responsive" style="width: 100%;overflow-x: auto;">
                                        <table id="productsList" class="table table-bordered table-hover">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><div><spring:message code="sl.no.label" /></div></th>
                                            	<th><spring:message code="skuid.label"/></th>
                                                <th><spring:message code="item.desc.label"/></th>
                                                <th><spring:message code="uom.label"/></th>
                                                <th><spring:message code="price.label"/></th>
                                                <th><spring:message code="stockReceipt.reqQty"/></th>
                                                <th><spring:message code="cost"/></th>
                                                <th><spring:message code="stockReceipt.suppliedQty"/></th>
                                                   <th><spring:message code="weighed.qty.label"/></th>
                                                <th><spring:message code="received.label"/></th>
                                                <th><spring:message code="stockReceipt.rejectedQty"/></th>
                                          <%--  </tr>
                                          </thead>
                                              <tbody style="text-align: center;">
                       <c:forEach var="itemList" items="${stockReceiptDetails.reciptDetails}" varStatus="theCount">
             		   <tr>
             		   	<td>${theCount.count}</td>
              			<td>${itemList.item}</td>
                  		<td>${itemList.description}</td>
                  		<td>${itemList.uOM}</td>
                  		<td>${itemList.price}</td>
                  		<td>${itemList.quantity}</td>
                  		<td>${itemList.cost}</td>
                  		<td>${itemList.supplied }</td>
                  		<td>${itemList.recieved}</td>
                  		<td>${itemList.rejected}</td>
                  	   </tr> --%>
                  	   
                  	   <th style="display: none;"><spring:message code="action.label"/></th>
                         </tr>
                           </thead>
                           <tbody style="text-align: center;">
                              <c:forEach var="item" items="${stockReceiptDetails.reciptDetails}" varStatus="theCount">
                              <tr id="dynamicdiv${theCount.count}">
                              	<td class="slno">${theCount.count}</td>
								<td id="skuID${theCount.count}" >${item.skuId}</td>
								<input type="hidden" id="skuId${theCount.count}" value="${item.skuId}" />
								<input type="hidden" id="pluCode${theCount.count}" value="${item.pluCode}"/>
		<td id="Desc${theCount.count}"><div id="overflowtext"> <a href="#" data-toggle="tooltip"  title="${item.description}">${item.description}</a></div></td>    
								
<%--    								<td id="Desc${theCount.count}" >${item.description}</td>
 --%>   								<td id="UOM${theCount.count}" >${item.uom}</td>
   								<td class='Price' id="Price${theCount.count}" >${item.price}</td>
   								<td class='Pack' id="Pack${theCount.count}" >${item.quantity }</td>
   								<td id="Cost${theCount.count}" >${item.cost}</td>
   								<td id="Supplied${theCount.count}" >${item.supplied }</td>
   								<td  >${item.weighedQty}</td>
   								<td class='Received' id="Received${theCount.count}" >${item.recieved}</td>
   								<td onBlur='changeRejected(this);' id="Rejected${theCount.count}" >${item.rejected}</td>
   								<td id="Del${theCount.count}" style="display: none;" ><img id="Img${theCount.count}" src='${pageContext.request.contextPath}/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' title='Delete ${item.item}'/></td>
   	   						</tr>
                  	   
              		   </c:forEach> 
		 </tbody>
                                       </table>
                                    </div>
                                   <!--  </div> -->
                                    <br/> <br/>
                                    
                                     <div class="row">
                                         <div class="form-group  col-lg-12">
                                         	<label><spring:message code="remarks.label" /></label>
                                            <textarea class="form-control" name="remarks" id="remarks" style="resize: none;" readonly>${stockReceiptDetails.remarks}</textarea>
 										 </div>
                                        <!--  <div class="col-lg-3"></div> -->
                                        </div>
                                        <br/>



							<%-- <div class="row">
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
							</div> --%>
						
					<%-- <div class="row">
								<div class="col-lg-8"></div>
								<div class="form-group col-lg-3" style="text-align: right;"><label><spring:message code="stockrecipt.totalreceived" /> </label></div>
								<div class="form-group col-lg-1">
									<input type="text" readonly="readonly" class="form-control" id="totalReceived" name="totalReceived"  value="" />
								</div>
							</div>
							<div class="row">
								<div class="col-lg-8"></div>
								<div class="form-group col-lg-3" style="text-align: right;"><label><spring:message code="stockrecipt.totalrejected" /> </label></div>
								<div class="form-group col-lg-1">
									<input type="text" readonly="readonly" class="form-control" id="totalRejected" name="totalRejected"  value="" />
								</div>
							</div> --%>
							<div class="row">
								<div class="col-lg-8"></div>
								<div class="form-group col-lg-3" style="text-align: right;"><label><spring:message code="totalquantity.label" /> </label></div>
								<div class="form-group col-lg-1">
									<input type="text" readonly="readonly" class="form-control" id="totalQty" name="totalQty"  value="${stockReceiptDetails.receipt_total_qty}" />
								</div>
							</div>
							<div class="row">
								<div class="col-lg-8"></div>
								<div class="form-group col-lg-3" style="text-align: right;"><label><spring:message code="cost.label" /> </label></div>
								<div class="form-group col-lg-1">
									<input type="text" readonly="readonly" class="form-control" id="totalCost" name="totalCost"  value="${stockReceiptDetails.receipt_total}" />
								</div>
							</div>


						<input type="hidden" id="flowUnder" value="${flowUnder}">
						</div><!-- /.box-body -->

						<div class="row" style="text-align: center;">
								<c:if test="${sessionScope.role == 'super admin'}">
									 <c:forEach var="activity" items="${stockReceiptDetails.nextActivities}">
									 	<input type="button" style="margin-right:1%;width: 80px;position: relative;" class="btn bg-olive btn-inline" onclick="validateStockReceipt('${activity}','update','${stockReceiptDetails.goods_receipt_ref_num}','${stockReceiptDetails.id_goods_receipt}');" value="${activity}" />
									 </c:forEach>
								  </c:if>
								  <c:if test="${sessionScope.role != 'super admin'}">
									<c:if test="${flowUnder == 'outlet'}">
										 <c:forEach var="activity" items="${stockReceiptDetails.nextActivities}">
										 	<c:forEach var="accessControl" items="${sessionScope.outletGoodsTransferActivity}">
										 		<c:if test="${accessControl.appSubDocument == 'OutletStockReceipt' && activity == accessControl.appDocumentActivity}">
												 	<input type="button" style="margin-right:1%;width: 80px;position: relative;" class="btn bg-olive btn-inline" onclick="validateStockReceipt('${activity}','update','${stockReceiptDetails.goods_receipt_ref_num}','${stockReceiptDetails.id_goods_receipt}');" value="${activity}" />
										 		</c:if>
						     				</c:forEach> 
										 </c:forEach>
							        </c:if>
						           <%-- <c:if test="${flowUnder == 'warehouse'}">
										 <c:forEach var="activity" items="${stockReceiptDetails.nextActivities}">
										 	<c:forEach var="accessControl" items="${sessionScope.warehouseSalesOrderActivity}">
										 		<c:if test="${activity == accessControl.appDocumentActivity}">
												 	<input type="button" style="margin-right:1%;width: 80px;position: relative;" class="btn bg-olive btn-inline" onclick="validateStockReceipt('${activity}','update','${stockReceiptDetails.goods_receipt_ref_num}','${stockReceiptDetails.id_goods_receipt}');" value="${activity}" />
										 		</c:if>
						     				</c:forEach> 
										 </c:forEach>
						           </c:if> --%>
							      </c:if>
						
						 <!--added by manasa  -->
                              <input type="hidden" id="operation" value="${operation}">
                       <input type="hidden" id="outletCategory" value="${stockReceiptObj.category}">
   <input type="hidden" id="outletBrandId" value="${stockReceiptObj.brand}">
    <input type="hidden" id="outletLocation" value="${stockReceiptObj.storeLocation}"> 
      <input type="hidden" id="outletSubcategory" value="${stockReceiptObj.subCategory}">
       <%-- <input type="hidden" id="outletDepartmentId" value="${skuObj.department}">
        <input type="hidden" id="outletSupplierId" value="${skuObj.supplierName}">  --%>
        <input type="hidden" id="outletZone" value="${stockReceiptObj.zoneId}">
       <input type="hidden" id="from" value="${stockReceiptObj.startDate}">
        <input type="hidden" id="to" value="${stockReceiptObj.endDate}">   
        <input type="hidden" id="stockReceipts" value="${stockReceiptObj.searchCriteria}"> 
            <!--//..added by manasa  -->  
            
						
						
							<%-- <c:forEach var="activity" items="${stockReceiptDetails.nextActivities}">									
							 	<input type="button" style="margin-right:1%;width: 80px;position: relative;" class="btn bg-olive btn-inline" onclick="validateStockReceipt('${activity}','update','${stockReceiptDetails.goods_receipt_ref_num}','${stockReceiptDetails.id_goods_receipt}');" value="${activity}" />
							 </c:forEach> --%>
							<input type="button" style="" class="btnCls" onclick="searchStockReceipts('','all','0');" value="<spring:message code="cancel.label" />" />
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
              /*  $('#productsList').dataTable({
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
		    		 