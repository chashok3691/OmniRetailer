<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri
 * file name		        : Inventory Manager/master/newSku.jsp
 * file type		        : JSP
 * description				: The new Sku is displayed using this jsp
 * */ -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
	<script src="${pageContext.request.contextPath}/js/controller.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/stockTransfer/stockRequest.js"></script>
	<style type="text/css">
		#overflowtext{

width : 250px;
overflow: hidden;
text-overflow: ellipsis;
 text-align: left;
white-space: nowrap;
}
	.buttons {
	/* float: right; */
	padding-top: 0px;
	/* margin-right: 2%; */
	/* margin-top:1%; */
}
a.button, .list a.button {
	position:relative;
	text-decoration: none;
	color: black;
	display: inline-block;
	padding: 5px 15px 5px 15px;
	background: rgb(195,195,195);
	border-radius: 5px;
	box-shadow:1px 0px 2px #000;
	cursor:pointer;
	behavior : url(css/PIE.htc); 
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
  .p:first-child { 
   border-bottom: none !important;
    width:0% !important; 
    padding-left: 0px !important;
    padding-right: 0px !important;
}
	</style>
	<script type="text/javascript">
$(document).ready(function(){
   	/* callCalender("requestDate");	
	callCalender("deliveryDate");	
   	var toWarehouse = $("#toWarehouse").val();
    $("#from option[value='"+toWarehouse+"']").remove();
    $("#toWarehouse").change(function () {
		$("#from").append('<option value="'+toWarehouse+'">'+toWarehouse+'</option>');
		toWarehouse = $("#toWarehouse").val();
	    $("#from option[value='"+toWarehouse+"']").remove();
	}); */
}); 
	</script>
</head>
<body>
<section class="content">
<div class="row">
  <div class="col-xs-12">
	<div class="box box-primary">
		<div class="box-header" style="text-align: center">
             <h3><spring:message code="view.stock.request.label" />&nbsp;&nbsp;:&nbsp;&nbsp;${stockRequestsObj.stockRequestId}</h3>
        </div>
		 <form id="newDepartment">
            <div class="box-body">
            	<div class="row">
	              <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
	            </div>
          		 <div class="row">
          	  <div class="col-lg-2" >
								             <label><spring:message code="zone.label"/></label>
							               <div class="col-lg-12" style="    padding-left: 0px;padding-right: 0px;">
							                <input class="form-control" type="text" Readonly value="${stockRequestsObj.zoneId}">
								               <%--   <select class="form-control" Readonly id="outletZone"><!-- searchStockRequests('','','0'); -->
								                       <option value=""><spring:message code="ALL.label"/></option>
									                   <c:forEach var="zoneList" items="${zoneList}">
															<option Readonly value="${zoneList.zoneID}" ${zoneList.zoneID == stockRequestsObj.zoneId ? 'selected' : ''} id="${zoneList.zoneID}" >${zoneList.zoneID}</option>
														</c:forEach>
							                   </select> --%>
							               
								        	</div>
								        </div>
								         <div class="form-group col-md-1"></div>
          	 	 <div class="form-group col-md-2">
			     	<label><spring:message code="fromlocation.label" /></label>
			     	 <input class="form-control" type="text" Readonly value="${stockRequestsObj.fromStoreCode}">
			    
                    <span id="fromError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                 </div> <div class="form-group col-md-1"></div>
                 <input type="hidden" id="stockRequestId" value="${stockRequestsObj.stockRequestId}">
              
			    <div class="form-group col-md-2">
			   	<label><spring:message code="supplier.shipment.mode.label" /></label>
			   	 <input class="form-control" type="text" Readonly value="${stockRequestsObj.shippingMode}">
			   	
                   <span id="deptDescError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
			   </div>
			   <div class="form-group col-md-1"></div>
			   <div class="form-group col-md-2">
                  	<label><spring:message code="tolocation.label" /></label>
                  	 <input class="form-control" type="text" Readonly value="${stockRequestsObj.toWareHouseId}">
                  	<input type="hidden" id="outletLocation">
                  	
                   <span id="toWarehouseError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                   <input type="hidden" id="flowUnder" value="${flowUnder}">
			   </div>
			    <div class="form-group col-md-1"></div>
			 </div>
			 <div class="row">
               <div class="form-group col-md-2">
               		<label><spring:message code="request.date.label" /></label>
                  	<input class="form-control" Readonly value="${stockRequestsObj.requestDateStr}" name="requestDate" id="requestDate" type="text"/>
                   <span id="requestDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
			   </div>
			    <div class="form-group col-md-1"></div>
			     <div class="form-group col-md-2">
			     	<label><spring:message code="delivery_date.label" /></label>
			     	
			     	<input class="form-control " Readonly   name="deliveryDate" id="deliveryDate" size="20" type="text"  value="${stockRequestsObj.deliveryDateStr}" />
                   <span id="deptDescError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
			  <div class="form-group col-md-1"></div>
               <div class="form-group col-md-2">
                  	<label><spring:message code="requested.by.label" /> <span style="color:red; font-size:2">*</span></label>
                   <input type="text" class="form-control" Readonly  id="requestedUserName" value="${stockRequestsObj.requestedUserName}" />
                   <span id="requestedByError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
			   </div>
			 <%--   <div class="form-group col-md-2">
                  <label><spring:message code="request.reason" /> <span style="color:red; font-size:2">*</span></label>
                   <input type="text" class="form-control" Readonly  id="reason" value="${stockRequestsObj.reason}"/>
                   <!--  <select class="form-control" name="requestReason" id="requestReason">
						<option value="Extra Demand">Extra Demand</option>
						<option value="Replenishment Delay">Replenishment Delay</option>
						<option value="Out of Stock">Out of Stock</option>
                   </select> -->
			   </div> --%>
			   <div class="form-group col-md-1"></div>
			    <div class="form-group col-md-2">
			   	<label><spring:message code="priority.label" /></label>
			   	 <input class="form-control" type="text" Readonly value="${stockRequestsObj.priority}">
			  
                   <span id="deptDescError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
			   </div>
			    <div class="form-group col-md-1"></div>
			   
			 </div>
			 <div class="row">
              
			    <%--  <div class="form-group col-md-3">
                  	<label><spring:message code="approved.by.label" /></label>
                  	<input class="form-control" Readonly value="${stockRequestsObj.requestApprovedBy}"  name="requestApprovedBy" id="requestApprovedBy" type="text" />
                   <span id="deptDescError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
			     </div> --%>
			   
			 </div>
			  
			
			
			
			
			
		
			<br>
		      											<div class="col-lg-12" style="background: #eee;padding: 10px 0px 10px 0px;">
      									<div class="col-lg-9">
      									
      									<div class="col-lg-9" style="padding-left: 0px;    padding-top: 5px;">
      									  <c:forEach var="previousWorkFlowList" items="${stockRequestsObj.previousStates}">
      									  <div class="p" style="display:inline-block;"></div>
                                             <span class=" border" style="padding-left: 0px;padding-top: 17px;font-size: 16px;"><img alt="" style="height:30px" src="${pageContext.request.contextPath}/images/workflow_arrow.png">${previousWorkFlowList}
      									
      									</span>
      									
                                             </c:forEach></div>
      									</div>
      						
      									<div class="col-lg-1"></div>
      									</div>
			
			<br><br><br>
			<div style="padding-bottom: 15px"></div>
		  <div class="table-responsive" style="overflow:scroll">
            <table id="productsList" class="table table-bordered table-hover">
              <thead style="background-color: #3c8dbc; color: #ffffff">
                <tr>
                <th><div><spring:message code="sl.no.label" /></div></th>
                	<th><spring:message code="skuid.label"/></th>
                	<th><spring:message code="itemScanCode.label"/></th>
                    <th><spring:message code="description.label"/></th>
                    <th><spring:message code="uom.label"/></th>
                     <th><spring:message code="color.label"/></th>
                    <th><spring:message code="size.label"/></th>
                    <th><spring:message code="price.label"/></th>
                     <th><spring:message code="qoh.label"/></th>
                    <th><spring:message code="prv.indent.qty.label"/></th>
                    <th><spring:message code="Reqqty.label"/></th>
                      <th><spring:message code="approvedqty.label"/></th>
                       <th><spring:message code="cost.label"/></th>
                   
               </tr>
              </thead>
									<tbody style="text-align: center;">
										<c:forEach var="stockRequests"
											items="${stockRequestsObj.stockRequestItems}"
											varStatus="theCount">
											<tr>
												<td>${theCount.count}</td>
												<td>${stockRequests.skuId}</td>
												 <td id="itemScanCode${theCount.count}" class="itemScanCode" >${stockRequests.itemScanCode}</td>
	<td ><div id="overflowtext"> <a href="#" data-toggle="tooltip"  title="${stockRequests.itemDesc}">${stockRequests.itemDesc}</a></div></td>    
												
<%-- 												<td>${stockRequests.itemDesc}</td>
 --%>												<td>${stockRequests.uom}</td>
												<td>${stockRequests.color}</td>
												<td>${stockRequests.size}</td>
												<td>${stockRequests.itemPrice}</td>
												 <td>${stockRequests.avlQty}</td>
                                                 <td>${stockRequests.prvIndentQty}</td>
												<td>${stockRequests.quantity}</td>
												<td>${stockRequests.approvedQty}</td>
												<c:choose>
													<c:when test="${flowUnder=='warehouse'}">
														<fmt:formatNumber var="totalcost" type="number"
															minFractionDigits="2" maxFractionDigits="2"
															value="${(stockRequests.approvedQty)*(stockRequests.itemPrice)}" />
													</c:when>
													<c:otherwise>
														<fmt:formatNumber var="totalcost" type="number"
															minFractionDigits="2" maxFractionDigits="2"
															value="${(stockRequests.quantity)*(stockRequests.itemPrice)}" />
													</c:otherwise>
												</c:choose>

												<td>${totalcost}</td>


											</tr>
										</c:forEach>
									</tbody>
								</table>
          <br/>
        </div>		
        
        
        <!--added by manasa  -->
    <input type="hidden" id="outletCategory" value="${stockRequestObj.category}">
   <input type="hidden" id="outletBrandId" value="${stockRequestObj.brand}">
    <input type="hidden" id="outletLocation" value="${stockRequestObj.storeLocation}"> 
      <input type="hidden" id="outletSubcategory" value="${stockRequestObj.subCategory}">
       <input type="hidden" id="outletDepartmentId" value="${stockRequestObj.department}">
        <input type="hidden" id="outletZone" value="${stockRequestObj.zoneId}">
       <input type="hidden" id="fromDate" value="${stockRequestObj.startDate}">
        <input type="hidden" id="to" value="${stockRequestObj.endDate}"> 
         <input type="hidden" id="maxRecords"> 
        <input type="hidden" id="searchStock" value="${stockRequestObj.searchCriteria}">   
            <!--//..added by manasa  -->       
        
         <div class="row">
	              <div class="form-group col-lg-8"></div>   
	              <div class="form-group col-lg-3" style="text-align: right;"> <label><spring:message code="shipping.cost.label" /></label></div>
	              <div class="form-group col-lg-1">
	                     <input type="text" class="form-control" name="shippingCost" readonly value="${stockRequestsObj.shippingCost}"/>
	              </div>
	       </div>
	        <div class="row">
	              <div class="form-group col-lg-8"></div>   
	              <div class="form-group col-lg-3" style="text-align: right;"> <label><spring:message code="total.cost.for.stock.request" /></label></div>
	              <div class="form-group col-lg-1">
	               <c:set var="qtyissued" value="0"  />
	              <c:forEach var="summaryList" items="${stockRequestsObj.stockRequestItems}" varStatus="thecount">
	                <c:choose>
              <c:when test="${flowUnder=='warehouse'}">
              
				<c:set var="qtyissued" value="${qtyissued+((summaryList.approvedQty)*(summaryList.itemPrice))}" scope="page" />
				</c:when>
				<c:otherwise>
				<c:set var="qtyissued" value="${qtyissued+((summaryList.quantity)*(summaryList.itemPrice))}" scope="page" />
				</c:otherwise></c:choose>
				</c:forEach>
				<fmt:formatNumber var="qtyissued" type="number" minFractionDigits="2" maxFractionDigits="2" value="${qtyissued}" />
	                     <input type="text" class="form-control" name="shipmentCharges" readonly value="${qtyissued}"/>
	              </div>
	       </div>
	       <div class="row">
              <div class="form-group col-lg-12">
                      <label><spring:message code="order.remarks.label" /></label>
                       <textarea class="form-control" readonly="readonly" name="remarks" rows="2" style="resize: none;">${stockRequestsObj.remarks}</textarea>
               </div>
           </div>
		<div class="row">
       	  <div class="col-lg-12" style="text-align: center;">
           	<%-- <c:forEach var="activity" items="${stockRequestsObj.nextActivities}">														
			 	<input type="button" style="margin-right:1%;width: 80px;position: relative;" class="btn bg-olive btn-inline" onclick="validateStockIssue('${activity}','update','${stockIssueDetails.goods_issue_ref_num}','${stockIssueDetails.id_goods_issue}');" value="${activity}" />
			 </c:forEach> --%>
       		<input type="button" style="width: 80px;" class="btn bg-olive btn-inline" onclick="searchStockRequests('','','0');" value="<spring:message code="cancel.label" />" />
        </div>
      </div>		
      <br/>
        <div class="box-footer"></div>
      </div>
   </form>
	</div>
  </div>
 </div>
</section>
</body>
</html>