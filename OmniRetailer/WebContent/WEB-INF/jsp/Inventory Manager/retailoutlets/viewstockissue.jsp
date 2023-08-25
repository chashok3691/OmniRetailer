<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : inventorymanager/retailoutlets/viewstockissue.jsp
 * file type		        : JSP
 * description				: The new store form is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    
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
<style>
	#overflowtext{

width : 250px;
overflow: hidden;
text-overflow: ellipsis;
 text-align: left;
white-space: nowrap;
}
  .odd{display:none!important;}
  
  .p:first-child { 
   border-bottom: none !important;
    width:0% !important; 
    padding-left: 0px !important;
    padding-right: 0px !important;
}
</style>
</head>
<body>
<!-- Main content -->
<section class="content">
<div class="row">
  <div class="col-lg-12">
				<div class="box box-primary">
                                <div class="box-header" style="text-align: center">
                                <br/>
                                <h3 class="box-title" style="padding :5px;  border:1px solid  #808080;"><spring:message code="view.stockissue.label" />&nbsp;&nbsp;:&nbsp;&nbsp;${stockIssueDetails.goods_issue_ref_num}</h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form role="form">
                                    <div class="box-body">
                                     <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
                                    
                                    <div class="row">
                                    <div class="form-group col-lg-2" style="margin-bottom:0px">
                                            <label><spring:message code="date.label" /></label>
	                                        <input class="form-control calendar_icon" readonly="readonly" value="${stockIssueDetails.createdDateStr}" name="createdDate" id="createdDate" size="20" type="text" />
                                        </div>
                                         <div class="form-group col-lg-1" style="margin-bottom:0px"></div>
                                        <div class="form-group col-lg-2" style="margin-bottom:0px">
                                            <label><spring:message code="delivery_date.label" /></label>
                                            <input type="text" class="form-control" name="deliveryDate" id="date" readonly value="${stockIssueDetails.deliveryDate}"/>
                                        </div>
                                         <div class="form-group col-lg-1" style="margin-bottom:0px" ></div>
                                         
                                          
                                      <div class="form-group col-lg-2" style="margin-bottom:0px" >
                                            <label><spring:message code="requested.label" /> <spring:message code="by.label" /></label>
                                            <c:choose>
                                            <c:when test="${flowUnder=='warehouse'}">
                                              <input type="text" class="form-control" id="requested" name="Requested_by"  readonly value="${stockIssueDetails.indentedBy}" />
                                            </c:when>
                                            <c:otherwise>
                                             <input type="text" class="form-control" id="requested" name="Requested_by"  readonly value="${stockIssueDetails.requestedBy}" />
                                            </c:otherwise>
                                            </c:choose>
                                           
                                            <span id="receivedByError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        <div class="form-group col-lg-1" style="margin-bottom:0px"  ></div>
                                    <div class="form-group col-lg-2" style="margin-bottom:0px" >
                                            <label>From Location</label>
                                            <input type="hidden" id = "fromlocation">
                                            <%-- <input type="text" class="form-control" readonly name="shipped_from" id="fromLocation" value="${stockIssueDetails.shipped_from}"/> --%>
                                            <select class="form-control" disabled="disabled" name="shipped_from" id="fromLocation">
												<option value="${stockIssueDetails.shipped_from}">${stockIssueDetails.shipped_from}</option>
                                           </select>
                                     </div>
                                     
                                     
                                     
                                     <div class="form-group col-lg-1" style="margin-bottom:0px" ></div>
                                        
                                        
                                        
                                        
                                        
                                         <div class="form-group col-lg-1" style="margin-bottom:0px"></div>
                                        </div>
                                    <div class="row">
                                    	<div class="form-group col-lg-3" style="margin-bottom:0px" >
                                            <label><spring:message code="stock.request.ref.label" /></label>
											<input type="text" name="stockRequestRef" id="stockRequestRef" readonly="readonly" class="form-control" value="${stockIssueDetails.goods_Request_Ref}"  />
                                            <span id="stockRequestRefError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div>
                                        
                                        <div class="form-group col-lg-2"  style="margin-bottom:0px">
                                        <label><spring:message code="shiper_id.label" /></label>
                             <input class="form-control" readonly="readonly"  name="transporter" id="transporter"  type="text" />
                                        
                                        
                                        </div>
                                        <div class="form-group col-lg-1" style="margin-bottom:0px"></div>
                                        <div class="form-group col-lg-2" style="margin-bottom:0px">
                                            <label><spring:message code="delivered.by.label" /></label>
                                            <input type="text" class="form-control" name="delivered_by" id="delivered" readonly value="${stockIssueDetails.delivered_by}"/>
                                        </div> 
                                        
                                        <div class="form-group col-lg-1" style="margin-bottom:0px"></div>
                                        <div class="form-group col-lg-2" style="margin-bottom:0px">
                                            <label><spring:message code="tolocation.label" /></label>
                                            <select class="form-control" disabled="disabled" name="receipt_location" id="tolocation">
												<option value="${stockIssueDetails.issue_to}">${stockIssueDetails.issue_to}</option>
                                           </select>
                                           <%--  <input type="text" class="form-control" name="receipt_location" id="tolocation" readonly  value="${stockIssueDetails.issue_to}"/> --%>
                                        </div>
                                        
                                       
                                        
                                      
        								</div>
        
         							<div class="row">
                                     <input type="hidden" id="type" value="issue" />
                                     <div class="form-group col-lg-2" >
                                         <label><spring:message code="requestdate.label" />/<spring:message code="time.label" /></label>
                             <input class="form-control" readonly="readonly" value=""  name="reqdatetime" id="reqdatetime"  type="text" />
                                        
                                        
                                        </div>
                                   <%--  	<div class="form-group col-lg-3">
                                            <label><spring:message code="requestdate.label" /></label>
	                                        <input class="form-control calendar_icon"  readonly style="background-color: white;" name="requestedDate" id="rdate" size="20" type="text"  />
                                           <span id="requestedDateError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div> --%>
                                <%--      
                                     <div class="form-group col-lg-3">
                                            <label><spring:message code="shipmentrefno.label" /><span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" name="ShipmentRefNo" id="shipmentrefno" readonly value="${stockIssueDetails.shipmentRefNo}"/>
                                            <span id="ByError" style="text-align:right;color:red;font-weight:bold;"></span>
                                        </div> --%>
                                     
                                    
                                      <div class="form-group col-lg-1" ></div>
                                     <div class="form-group col-lg-2" >
                                            <label><spring:message code="shipmentmode.label" /></label>
                                            <input type="hidden" id = "fromlocation">
                                             <select class="form-control" disabled="disabled" name="shipped_from" id="shipmentMode">
                                          
												<option value="${stockIssueDetails.shipmentMode}" >${stockIssueDetails.shipmentMode}</option>
				
                                           </select>
                                        </div>
                                         <div class="form-group col-lg-1" ></div>
                                          <div class="form-group col-lg-2" >
                                            <label><spring:message code="received.label" /> <spring:message code="by.label" /> </label>
                                            <input type="text" class="form-control" id="received" name="Received_by" readonly value="${stockIssueDetails.received_by}"/>
                                        </div> 
        								</div>
                             
                              			 <c:choose>
									      <c:when test="${flowUnder=='warehouse'}">
                                         <div class="col-lg-12" style="background: #eee;padding: 10px 0px 10px 0px;margin-bottom: 10px">
      									<div class="col-lg-9">
      									
      									<div class="col-lg-9" style="padding-left: 0px;    padding-top: 5px;">
      									  <c:forEach var="previousWorkFlowList" items="${stockIssueDetails.previousWorkFlowList}">
      									  <div class="p" style="display:inline-block;"></div>
                                             <span class=" border" style="padding-left: 0px;padding-top: 17px;font-size: 16px;"><img alt="" style="height:30px" src="${pageContext.request.contextPath}/images/workflow_arrow.png">${previousWorkFlowList}
      									
      									</span>
      									
                                             </c:forEach></div>
      									</div>
      						
      									<div class="col-lg-1"></div>
      									</div>
                                   </c:when>
                                   <c:otherwise>
                                   <div class="col-lg-12" style="background: #eee;padding: 10px 0px 10px 0px;margin-bottom: 10px">
      									<div class="col-lg-9">
      									
      									<div class="col-lg-9" style="padding-left: 0px;    padding-top: 5px;">
      									  <c:forEach var="previousWorkFlowList" items="${stockIssueDetails.previousStates}">
      									  <div class="p" style="display:inline-block;"></div>
                                             <span class=" border" style="padding-left: 0px;padding-top: 17px;font-size: 16px;"><img alt="" style="height:30px" src="${pageContext.request.contextPath}/images/workflow_arrow.png">${previousWorkFlowList}
      									
      									</span>
      									
                                             </c:forEach></div>
      									</div>
      						
      									<div class="col-lg-1"></div>
      									</div>
                                   
                                   </c:otherwise>
                                   </c:choose>
        								<%-- <div class="row">
      									<div class="col-lg-9">
      									<div class="col-lg-1" style="padding-left: 0px;padding-top: 17px;">
      									<img alt="" style="height:30px" src="${pageContext.request.contextPath}/images/workflow_arrow.png">
      									</div>
      									<div class="col-lg-9" style="padding-left: 0px;    padding-top: 13px;">
      									  <c:forEach var="previousWorkFlowList" items="${stockIssueDetails.previousWorkFlowList}">
      									  <div class="p" style="padding-left: 15px;padding-right:15px;padding-top: 25px;border-bottom: 1px solid #ccc;width:10%;display:inline-block;"></div>
                                             <span class=" border" style="padding-left: 0px;padding-top: 17px;font-size: 16px;">${previousWorkFlowList}
      									
      									</span>
      									
                                             </c:forEach></div>
      									</div>
      									<div class="col-lg-3">
      									<label><spring:message code="actionrecquired.label" /></label>
                                            <input type="hidden" value="${stockIssueDetails.status}" id="defaultstatus">
                                             <select class="form-control" name="shipped_from" id="statusissue">
                                             <option value="">Action Required</option>
                                               <c:forEach var="activity" items="${stockIssueDetails.nextActivities}">
                                              <option value="${activity}">${activity}</option>
                                             </c:forEach>
                                              <c:forEach var="nextWorkFlowStates" items="${stockIssueDetails.nextWorkFlowStates}">
                                              <option value="${nextWorkFlowStates}">${nextWorkFlowStates}</option>
                                             </c:forEach>
                                           </select>
      									
      									
      									</div>
      									</div> --%>
        
        
        
        
                                     <br>
                                      <div class="table-responsive">
                                       <c:choose>
									      <c:when test="${flowUnder=='warehouse'}">
									        <table id="productsList" class="table table-bordered table-hover">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><div ><spring:message code="sl.no.label" /></div></th>
                                            	<th><spring:message code="item.code.label"/></th>
                                          <%--   <th><spring:message code="itemScanCode.label"/></th> --%>
                                                <th><spring:message code="item.desc.label"/></th>
                                                <th><spring:message code="uom.label"/></th>
                                                <th><spring:message code="price.label"/></th>
                                                <th><spring:message code="Reqqty.label"/></th>
                                                     <th><spring:message code="issued.qty.label"/></th>
                                                      <th><spring:message code="variance.label" /> </th>
                                                      <th>Pack Ref</th>
                                                       <th><spring:message code="actualqty.label"/></th>
                                                <th><spring:message code="sale.value"/></th>
                                               
                                            </tr>
                                          </thead>
                                          <tbody style="text-align: center;">
                                            <c:forEach var="item" items="${stockIssueDetails.itemDetails}" varStatus="theCount">
                                              <tr id=dynamicdiv${theCount.count}>
                                              <td class="slno">${theCount.count}</td>
              									<td id="Name${theCount.count}" >${item.skuId}</td>
              									<input type="hidden" id="skuId${theCount.count}" value="${item.skuId}" />
              									<input type="hidden" id="pluCode${theCount.count}" value="${item.pluCode}"/>
                  								<%--  <td id="itemScanCode${theCount.count}" contenteditable="true" >${item.itemScanCode}</td> --%>
           <td id="Desc${theCount.count}"><div id="overflowtext"> <a href="#" data-toggle="tooltip"  title="${item.description}">${item.description}</a></div></td>    
                  							
<%--                   								<td id="Desc${theCount.count}" >${item.description}</td>
 --%>                  								<td id="UOM${theCount.count}" >${item.uom}</td>
                  								<td class='Price' id="Price${theCount.count}" >${item.price}</td>
                  								<td class='Pack'  >${item.indentQty }</td>
                  								<td id="Supplied${theCount.count}" onBlur='changeIssued(this);' onkeypress='return (this.innerText.length < 10)'  >${item.quantity }</td>
                  								<td  >${(item.indentQty)-(item.quantity)}</td>
                  								<td class='packReference' id="packReference${theCount.count}" >${item.packageReference}</td>
                  								<td class='Received' id="Received${theCount.count}"   >${item.actualQty}</td>
                  								
                  								<fmt:formatNumber type="number" maxFractionDigits="2"  var="cost" value="${(item.price)*(item.quantity)}" /> 

                  								<td id="Cost${theCount.count}" >${cost}</td>
                  								<%-- <td onBlur='changeRejected(this);' onkeypress='return (this.innerText.length < 10)' contenteditable='true' id="Rejected${theCount.count}" >${item.rejected}</td> --%>
                  	   						</tr>
             		   						  
              		   						</c:forEach> 
                                          </tbody>
                                       </table>
									      
									      </c:when>
									      <c:otherwise>
                                        <table id="productsList" class="table table-bordered table-hover">
                                          <thead style="background-color: #3c8dbc; color: #ffffff">
                                            <tr>
                                            	<th><div ><spring:message code="sl.no.label" /></div></th>
                                            	<th><spring:message code="item.code.label"/></th>
                                             	<th><spring:message code="itemScanCode.label"/></th>
                                                <th><spring:message code="item.desc.label"/></th>
                                                <th><spring:message code="uom.label"/></th>
                                                <th><spring:message code="price.label"/></th>
                                                 <th><spring:message code="Reqqty.label"/></th>
                                            <th><spring:message code="issued.qty.label"/></th>
                                                      <th><spring:message code="variance.label" /> </th>
                                                       <th><spring:message code="actualqty.label"/></th>
                                             <%--    <th><spring:message code="rejected.label"/></th> --%>
                                        <th><spring:message code="cost"/></th>
                  		
                  		 <th style="display: none;"><spring:message code="action.label"/></th>
                       </tr>
                     </thead>
                  <tbody style="text-align: center;">
                   <c:forEach var="item" items="${stockIssueDetails.itemDetails}" varStatus="theCount">
                      <tr id="dynamicdiv${theCount.count}">
                      <td class="slno">${theCount.count}</td>
					  <td id="Name${theCount.count}" >${item.item}</td>
					  <input type="hidden" id="skuId${theCount.count}" value="${item.skuId}" />
					  <input type="hidden" id="pluCode${theCount.count}" value="${item.pluCode}"/>
					   <td id="itemScanCode${theCount.count}" contenteditable="true" >${item.itemScanCode}</td>
		<td id="Desc${theCount.count}"><div id="overflowtext"> <a href="#" data-toggle="tooltip"  title="${item.description}">${item.description}</a></div></td>    
					   
<%-- 					  <td id="Desc${theCount.count}" >${item.description}</td>
 --%>					  <td id="UOM${theCount.count}" >${item.uom}</td>
					  <td class='Price' id="Price${theCount.count}" >${item.price}</td>
					  <td class='Pack' id="Pack${theCount.count}" >${item.quantity}</td>
					
					  <td id="Supplied${theCount.count}" >${item.quantity}</td>
					  <fmt:formatNumber type="number" maxFractionDigits="2"  var="variance" value="${item.quantity-item.quantity}" />
					  <td id="Supplied${theCount.count}" >${variance}</td>
					  <td class='Received' id="Received${theCount.count}" >${item.recieved}</td>
					    <td id="Cost${theCount.count}" >${(item.price)*(item.quantity)}</td>
					  <%-- <td id="Rejected${theCount.count}" >${item.rejected}</td> --%>
					  <td id="Del${theCount.count}" style="display: none;" ><img id="Img${theCount.count}" src='${pageContext.request.contextPath}/images/itemdelete.png' style='width:15%;cursor:pointer;' onclick='deleteItem(this);' title='Delete ${item.item}'/></td>
 					</tr>
       		   </c:forEach> 
		 </tbody>
           </table></c:otherwise></c:choose>
        </div>
        <br/> <br/>
        
        <div class="row">
							
							
							
							
							<div class="form-group  col-lg-3" style="margin-left: 54px;margin-top: 26px;">
							
					<input type="button" style="width: 80px;margin-left: 70px;" class="btn bg-olive btn-inline btnCls" onclick="searchStockIssues('','all','0');" value="<spring:message code="cancel.label" />" />
							
							
						</div>
							
						
							
								 <div class="form-group  col-lg-4">
                                         	
               			 <textarea class="form-control" name="remarks" id="remarks" rows="4" style="resize: none;" readonly>${stockIssueDetails.remarks}</textarea>
 										 </div>
 										 
 									<div class="form-group col-lg-4" style="border:1px solid #ccc"> 
 										<div class="form-group col-lg-12" style="margin-bottom: 0px; margin-top: 1%;"> 
 										<c:set var="CountItem" value="0"  />
 										 <c:set var="qtyissued" value="0"  />
 									 <c:forEach var="summaryList" items="${stockIssueDetails.itemDetails}" varStatus="thecount">
								<c:set var="qtyissued" value="${qtyissued+((summaryList.quantity))}" scope="page" />
								<c:set var="CountItem" value="${CountItem+1}" scope="page" />
									</c:forEach>
 									<div class="form-group col-lg-3"> 
 									<label style=" white-space: nowrap;"><spring:message code="summary.itemcount" /> </label>
 									</div>
 									<div class="form-group col-lg-3" style="padding-right: 0px;">
									<input type="text" readonly="readonly" class="form-control" id="itemcount" name="itemcount"  value="${CountItem}" />
								</div>
 									
 									<div class="form-group col-lg-3"> 
							<label style=" white-space: nowrap;"><spring:message code="totalqty.label" /> </label>
							</div>
								<div class="form-group col-lg-3" style="padding-right: 0px;">
									
	             
							<input type="text" readonly="readonly" class="form-control" id="totalQty" name="totalQty"  value="${qtyissued}" />
						</div>
								</div>
								<div class="form-group col-lg-12" style="margin-bottom: -2%;"> 
								<div class="form-group col-lg-3">
				<label style=" white-space: nowrap;"><spring:message code="discount.label" /> </label>
 
								</div>
								<div class="form-group col-lg-3" style="padding-right: 0px;">
						       <input type="text" readonly="readonly" class="form-control" id="discount" name="discount"  value="0" />
								
								</div>
								<div class="form-group col-lg-3">
								
								<label style=" white-space: nowrap;"><spring:message code="cost.label" /> </label>
								</div>
								
								<div class="form-group col-lg-3" style="padding-right: 0px;">
								 <c:set var="qty" value="0"  />
	              <c:forEach var="summaryList" items="${stockIssueDetails.itemDetails}" varStatus="thecount">
				<c:set var="qty" value="${qty+((summaryList.quantity)*(summaryList.price))}" scope="page" />
				
		<fmt:formatNumber type="number" maxFractionDigits="2"  var="tcost" value="${qty}" />
				
				</c:forEach>
							<input type="text" readonly="readonly" class="form-control" id="totalCost" name="totalCost"  value="${tcost}" />
								</div>
								
							</div>
							</div>
<%--          <div class="row">
             <div class="form-group  col-lg-12">
             	<label><spring:message code="remarks.label" /></label>
                <textarea class="form-control" name="remarks" id="remarks"  style="resize: none;" readonly>${stockIssueDetails.remarks}</textarea>
			</div>
        </div>
        <br/>

					<div class="row">
						<div class="col-lg-8"></div>
						<div class="form-group col-lg-3" style="text-align: right;"><label><spring:message code="totalquantity.label" /> </label></div>
						<div class="form-group col-lg-1">
						 <c:set var="qtyissued" value="0"  />
	              <c:forEach var="summaryList" items="${stockIssueDetails.itemDetails}" varStatus="thecount">
				<c:set var="qtyissued" value="${qtyissued+((summaryList.quantity))}" scope="page" />
				</c:forEach>
							<input type="text" readonly="readonly" class="form-control" id="totalQty" name="totalQty"  value="${qtyissued}" />
						</div>
					</div>
					<div class="row">
						<div class="col-lg-8"></div>
						<div class="form-group col-lg-3" style="text-align: right;"><label><spring:message code="cost.label" /> </label></div>
						<div class="form-group col-lg-1">
						  <c:set var="qty" value="0"  />
	              <c:forEach var="summaryList" items="${stockIssueDetails.itemDetails}" varStatus="thecount">
				<c:set var="qty" value="${qty+((summaryList.quantity)*(summaryList.price))}" scope="page" />
				</c:forEach>
							<input type="text" readonly="readonly" class="form-control" id="totalCost" name="totalCost"  value="${qty}" />
						</div>
					</div> --%>
						</div><!-- /.box-body -->
						<input type="hidden" id="flowUnder" value="${flowUnder}">  
						<div class="row" style="text-align: center;">
							<%-- <c:if test="${sessionScope.role == 'super admin'}">
									 <c:forEach var="activity" items="${stockIssueDetails.nextActivities}">
									 	<input type="button" style="margin-right:1%;width: 80px;position: relative;" class="btn bg-olive btn-inline btnCls" onclick="validateStockReceipt('${activity}','update','${stockReceiptDetails.goods_receipt_ref_num}','${stockReceiptDetails.id_goods_receipt}');" value="${activity}" />
									 </c:forEach>
								  </c:if>
								  <c:if test="${sessionScope.role != 'super admin'}">
									<c:if test="${flowUnder == 'outlet'}">
										 <c:forEach var="activity" items="${stockIssueDetails.nextActivities}">
										 	<c:forEach var="accessControl" items="${sessionScope.outletGoodsTransferActivity}">
										 		<c:if test="${accessControl.appSubDocument == 'OutletStockIssue' && activity == accessControl.appDocumentActivity}">
												 	<input type="button" style="margin-right:1%;width: 80px;position: relative;" class="btn bg-olive btn-inline btnCls" onclick="validateStockReceipt('${activity}','update','${stockReceiptDetails.goods_receipt_ref_num}','${stockReceiptDetails.id_goods_receipt}');" value="${activity}" />
										 		</c:if>
						     				</c:forEach> 
										 </c:forEach>
							        </c:if>
						           <c:if test="${flowUnder == 'warehouse'}">
										 <c:forEach var="activity" items="${stockIssueDetails.nextActivities}">
										 	<c:forEach var="accessControl" items="${sessionScope.warehouseGoodsTransferActivity}">
										 		<c:if test="${accessControl.appDocument == 'WarehouseStockIssue' && activity == accessControl.appDocumentActivity}">
												 	<input type="button" style="margin-right:1%;width: 80px;position: relative;" class="btn bg-olive btn-inline btnCls" onclick="validateStockReceipt('${activity}','update','${stockReceiptDetails.goods_receipt_ref_num}','${stockReceiptDetails.id_goods_receipt}');" value="${activity}" />
										 		</c:if>
						     				</c:forEach> 
										 </c:forEach>
						           </c:if>
							      </c:if> --%>
						
						
						 <!--added by manasa  -->
                              <input type="hidden" id="operation" value="${operation}">
        <input type="hidden" id="outletZone" value="${stockIssueObj.zoneId}">
       <input type="hidden" id="from" value="${stockIssueObj.startDate}">
        <input type="hidden" id="to" value="${stockIssueObj.endDate}">
        <input type="hidden" id="fromlocation" value="${stockIssueObj.outletLocation}">
         <input type="hidden" id="itemwise" value="">
       <input type="hidden" id=warehouseLocation value="${stockIssueObj.shipped_from}">   
          <input type="hidden" id="allIssuedStocks" value="${stockIssueObj.searchCriteria}">
            <!--//..added by manasa  -->  
						
							 <%-- <c:forEach var="activity" items="${stockIssueDetails.nextActivities}">														
							 	<input type="button" style="margin-right:1%;width: 80px;position: relative;" class="btn bg-olive btn-inline" onclick="validateStockIssue('${activity}','update','${stockIssueDetails.goods_issue_ref_num}','${stockIssueDetails.id_goods_issue}');" value="${activity}" />
							 </c:forEach> --%>
						</div>
						<br/>
                <div class="box-footer"></div>
                
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
		    		 