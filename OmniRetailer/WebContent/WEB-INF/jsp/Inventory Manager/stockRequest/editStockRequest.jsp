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
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
	<title>Home | Omni Retailer</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<script src="${pageContext.request.contextPath}/js/form_plugin.js"></script>
	<script src="${pageContext.request.contextPath}/js/controller.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/goodstransfer.js"></script>
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
	//searchlocationsBasedOnZone('outletZone','from','toWarehouse');
    callCalender("requestDate");	
	callCalender("deliveryDate");	
	focusDiv('Success');
	/*	var toWarehouse = $("#toWarehouse").val();
    $("#from option[value='"+toWarehouse+"']").remove();
    $("#toWarehouse").change(function () {
		$("#from").append('<option value="'+toWarehouse+'">'+toWarehouse+'</option>');
		toWarehouse = $("#toWarehouse").val();
	    $("#from option[value='"+toWarehouse+"']").remove();
	}); */
}); 
	</script>
	
	
	<!--  added by        :  koti bomminei
      description     :  to ristrict the user from entering special characters     -->


	
	 
	
	
</head>
<body>
<section class="content">
<div class="row">
  <div class="col-xs-12">
	<div class="box box-primary">
		<div class="box-header" style="text-align: center">
             <h3><spring:message code="edit.stock.request.label" />&nbsp;&nbsp;:&nbsp;&nbsp;${stockRequestsObj.stockRequestId}</h3>
        </div>
		 <form id="newDepartment">
            <div class="box-body">
            	<div class="row">
	              <div id="Error" style="text-align:center;color:red;font-weight:bold;">${err}</div>
	           <div id="Success" class="Error" style="text-align: center;color: blue;font-size: 2;font-weight: bold;margin-bottom: 10px; margin-top: 0px">${success}</div>
	              
	            </div>
	            
	            <div class="row">
       	  <div class="col-lg-12" style="text-align: center;">
           	<%-- <c:forEach var="activity" items="${stockRequestsObj.nextActivities}">														
			 	<input type="button" style="margin-right:1%;width: 80px;position: relative;" class="btn bg-olive btn-inline" onclick="validateStockIssue('${activity}','update','${stockIssueDetails.goods_issue_ref_num}','${stockIssueDetails.id_goods_issue}');" value="${activity}" />
			 </c:forEach> --%>
	     <%--   <input type="button" style="" class="btnCls" onclick="validateStockRequest('edit','${stockRequestsObj.stockRequestId}');" value="&nbsp;&nbsp;<spring:message code="submit.label" />&nbsp;&nbsp;" />
			 
       		<input type="button" style="" class="btnCls buttonMargin" onclick="searchStockRequests('','','0');" value="<spring:message code="cancel.label" />" /> --%>
        </div>
      </div>
	            
          	 <div class="row">
          	  <div class="col-lg-2" >
								             <label><spring:message code="zone.label"/></label>
							               <div class="col-lg-12" style="    padding-left: 0px;padding-right: 0px;">
							                
								                 <select class="form-control" id="outletZone" ><!-- searchStockRequests('','','0'); -->
								                       <option value=""><spring:message code="ALL.label"/></option>
									                   <c:forEach var="zoneList" items="${zoneList}">
															<option value="${zoneList.zoneID}" ${zoneList.zoneID == stockRequestsObj.zoneId ? 'selected' : ''} id="${zoneList.zoneID}" >${zoneList.zoneID}</option>
														</c:forEach>
							                   </select>
							               
								        	</div>
								        </div>
								        <div class="col-md-1"></div>
          	 	 <div class="form-group col-md-2">
			     	<label><spring:message code="fromlocation.label" /></label>
			     	<select class="form-control" id="from" ><!-- searchStockRequests('','','0'); -->
									                   <c:forEach var="outletlocationsList" items="${outletlocationsList}">
															<option value="${outletlocationsList}" ${outletlocationsList == stockRequestsObj.fromStoreCode ? 'selected' : ''} id="${outletlocationsList}" >${outletlocationsList}</option>
														</c:forEach>
							                   </select>
                    <span id="fromError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                 </div>
                  <div class="form-group col-md-1"></div>
                 <input type="hidden" id="stockRequestId" value="${stockRequestsObj.stockRequestId}">
              
			    <div class="form-group col-md-2">
			   	<label><spring:message code="supplier.shipment.mode.label" /></label>
			   	<select class="form-control" name="shipped_from" id="shippingMode">
                                             <option value="Rail"${Rail == stockRequestsObj.shippingMode ? 'selected' : ''} >Rail</option>
                                            <option value="Express" ${Express == stockRequestsObj.shippingMode ? 'selected' : ''}>Express</option>
                                            <option value="Flight" ${Flight == stockRequestsObj.shippingMode ? 'selected' : ''}>Flight</option>
                                            <option value="Express" ${Express == stockRequestsObj.shippingMode ? 'selected' : ''}>Express</option>
                                           </select>
                   <span id="deptDescError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
			   </div>
			    <div class="form-group col-md-1"></div>
			   <div class="form-group col-md-2">
                  	<label><spring:message code="tolocation.label" /></label>
                  	<input type="hidden" id="outletLocation">
                  		                     <select class="form-control" id="toWarehouse" ><!-- searchStockRequests('','','0'); -->
									                   <c:forEach var="location" items="${locationsList}">
															<option value="${location}" ${location == stockRequestsObj.toWareHouseId ? 'selected' : ''} id="${location}" >${location}</option>
														</c:forEach>
							                   </select>
                   <span id="toWarehouseError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                   <input type="hidden" id="flowUnder" value="${flowUnder}">
			   </div>
			    <div class="form-group col-md-1"></div>
			 </div>
			 <div class="row">
               <div class="form-group col-md-2">
               		<label><spring:message code="request.date.label" /></label>
                  	<input class="form-control calendar_icon" value="${stockRequestsObj.requestDateStr}" name="requestDate" id="requestDate" type="text" placeholder="DD/MM/YYYY"/>
                   <span id="requestDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
			   </div>
			      <div class="col-md-1"></div>
			     <div class="form-group col-md-2">
			     	<label><spring:message code="delivery_date.label" /></label>
			     	
			     	<input class="form-control calendar_icon"  style="background-color: white;" name="deliveryDate" id="deliveryDate" size="20" type="text"  value="${stockRequestsObj.deliveryDateStr}" onfocus="callCalender('deliveryDate')" onclick="callCalender('deliveryDate')" placeholder="DD/MM/YYYY"/>
                   <span id="deliveryDateError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
                                        </div>
			    <div class="col-md-1"></div>
               <div class="form-group col-md-2">
                  	<label><spring:message code="requested.by.label" /> <span style="color:red; font-size:2">*</span></label>
                   <input type="text" onblur="criteria(this)" class="form-control"  id="requestedUserName" value="${stockRequestsObj.requestedUserName}" />
                   <span id="requestedByError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
			   </div>
			<%--    <div class="form-group col-md-2">
                  <label><spring:message code="request.reason" /> <span style="color:red; font-size:2">*</span></label>
                   <input type="text" class="form-control"  id="reason" value="${stockRequestsObj.reason}"/>
                   <!--  <select class="form-control" name="requestReason" id="requestReason">
						<option value="Extra Demand">Extra Demand</option>
						<option value="Replenishment Delay">Replenishment Delay</option>
						<option value="Out of Stock">Out of Stock</option>
                   </select> -->
			   </div> --%>
			    <div class="form-group col-md-1"></div>
			       <div class="form-group col-md-2">
			   	<label><spring:message code="priority.label" /></label>
			   	<select class="form-control" name="shipped_from" id="priority">
                                             <option value="Normal"${Normal == stockRequestsObj.priority ? 'selected' : ''} >Normal</option>
                                            <option value="Low" ${Low == stockRequestsObj.priority ? 'selected' : ''}>Low</option>
                                            <option value="Medium" ${Medium == stockRequestsObj.priority ? 'selected' : ''}>Medium</option>
                                            <option value="High" ${High == stockRequestsObj.priority ? 'selected' : ''}>High</option>
                                           </select>
                   <span id="deptDescError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
			   </div>
			      <div class="col-md-1"></div>
			   
			 </div>
			 <div class="row">
              
			 <%--     <div class="form-group col-md-3">
                  	<label><spring:message code="approved.by.label" /></label>
                  	<input class="form-control" value="${stockRequestsObj.requestApprovedBy}"  name="requestApprovedBy" id="requestApprovedBy" type="text" />
                   <span id="deptDescError" style="text-align:right;color: red;font-size: 2;font-weight: bold;"></span>
			     </div> --%>
			 
			 </div>
		
		<br><br>
		      									<div class="col-lg-12" style="background: #eee;padding: 10px 0px 10px 0px;">
      									<div class="col-lg-9">
      									
      									<div class="col-lg-9" style="padding-left: 0px;    padding-top: 5px;">
      									  <c:forEach var="previousWorkFlowList" items="${stockRequestsObj.previousStates}">
      									  <div class="p" style="display:inline-block;"></div>
                                             <span class=" border" style="padding-left: 0px;padding-top: 17px;font-size: 16px;"><img alt="" style="height:30px" src="${pageContext.request.contextPath}/images/workflow_arrow.png">${previousWorkFlowList}
      									
      									</span>
      									
                                             </c:forEach></div>
      									</div>
      									<div class="col-lg-2" style="padding-right: 0px;">
      									<div class="col-lg-12" style="padding-right: 0px;padding-left: 5px;">
      									 <input type="hidden" value="${stockRequestsObj.status}" id="defaultstatus">
      									<c:choose>
      									<c:when test="${not empty stockRequestsObj.nextWorkFlowStates}">
      									<label><spring:message code="actionrecquired.label" /></label>
                                            <input type="hidden" value="${stockRequestsObj.status}" id="defaultstatus">
                                             <select class="form-control" name="shipped_from" id="statusissue">
                                             <option value="">Action Required</option>
                                               <c:forEach var="activity" items="${stockRequestsObj.nextWorkFlowStates}">
                                              <option value="${activity}">${activity}</option>
                                             </c:forEach>
                                              <c:forEach var="nextWorkFlowStates" items="${stockRequestsObj.nextActivities}">
                                              <option value="${nextWorkFlowStates}">${nextWorkFlowStates}</option>
                                             </c:forEach>
                                           </select>
      									</c:when>
      									<c:when test="${not empty stockRequestsObj.nextActivities}">
      									<label><spring:message code="actionrecquired.label" /></label>
                                           
                                             <select class="form-control" name="shipped_from" id="statusissue">
                                             <option value="">Action Required</option>
                                               <c:forEach var="activity" items="${stockRequestsObj.nextActivities}">
                                              <option value="${activity}">${activity}</option>
                                             </c:forEach>
                                              <c:forEach var="nextWorkFlowStates" items="${stockRequestsObj.nextWorkFlowStates}">
                                              <option value="${nextWorkFlowStates}">${nextWorkFlowStates}</option>
                                             </c:forEach>
                                           </select>
      									</c:when>
      									<c:otherwise>
      									 <input type="hidden" value="nostatus" id="nostatus">
      									</c:otherwise>
      									</c:choose>
      									
      									</div>
      									
      									</div>
      									<div class="col-lg-1"></div>
      									</div>
      									<div style="padding-bottom: 15px"></div>
									<input type="hidden" id="requestedQty" value="${stockRequestsObj.requestedQty}">
									<input type="hidden" id="requestApprovedBy" value="${stockRequestsObj.requestApprovedBy}">
									
									<input type="hidden" id="totalStockRequestValue" value="${stockRequestsObj.totalStockRequestValue}">
									
									<%-- <div class="row">
                                         <div class="form-group col-lg-12" style="text-align:center;margin-bottom: 0.5%;margin-top: 0.5%;">
                                         <input type="hidden" id="desc"/>
                                         	<label><spring:message code="search.items.here.label" /></label>
                                         	<input type="text"  class="form-control searchItems" id="searchItems" placeholder="<spring:message code="search.items.here.label" />"  style="height:30PX;text-align:left;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl request" style=""></ul>
								   				</div>
											</div>
			
                                        </div></div> --%>
			
	<div class="col-lg-12"></div>
	<div class="row">
                                         <div class="form-group col-lg-6" style="text-align:center;margin-bottom: 0.5%;width: 58%; margin-top: 1.5%;">
                                         <input type="hidden" id="desc"/>
                                         <%-- 	<label><spring:message code="search.items.here.label" /></label> --%>
                                         	<input type="text"  class="form-control searchItems" id="searchItems" placeholder="<spring:message code="search.items.here.label" />"  style="height:30PX;text-align:left;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;"/>
											<div class="services">
								    			<div class="items">
								     				<ul class="matchedStringUl request" style=""></ul>
								   				</div>
											</div>
			
                                        </div>
                        <div class="col-lg1-2 col-lg-2" style="margin-top: -2px;width: 14%;padding-left: 0px;">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="category.label"/></label>
                           <select class="form-control" id="outletCategory" onchange="searchSubCategories('outletCategory','outletSubCategory')">
                           		 <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="categoryList" items="${categoryList}">
									<option value="${categoryList.categoryName}" ${categoryList.categoryName == category ? 'selected' : ''} id="${categoryList.categoryName}" >${categoryList.categoryName}</option>
						 		</c:forEach>
	                        </select>
                      </div>
                      </div>
                      
                       <div class="col-lg1-2 col-lg-2" style="margin-top: -2px;width: 14%;padding-left: 0px;">
                       <div class="col-lg-12" style="padding-left:0px;padding-right: 0px;">
                           <label><spring:message code="subcategory.label"/></label>
                           <select class="form-control" id="outletSubCategory">
                           		  <option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="subCategoryDetailsList" items="${subCategoryDetailsList}">
									<option value="${subCategoryDetailsList.subcategoryName}" ${subCategoryDetailsList.subcategoryName == subcategory ? 'selected' : ''} id="${subCategoryDetailsList.subcategoryName}" >${subCategoryDetailsList.subcategoryName}</option>
						 		</c:forEach>
	                        </select>
	                        
                      </div>
                      
                      </div>
                      
                       <div class="col-lg1-2 col-lg-2" style="margin-top: -2px;padding:0px;padding-left: 0px;width: 14%;">
                       <div class="col-lg-7" style="padding-left:0px;padding-right: 0px;width:66%;">
                           <label>Brand</label>
                           <select class="form-control" id="outletBrand">
                           	<option value=""><spring:message code="ALL.label"/></option>
	                            <c:forEach var="brandsList" items="${brandsList}">
									<option value="${brandsList}" ${brandsList == brand ? 'selected' : ''} id="${brandsList}" >${brandsList}</option>
						 		</c:forEach>
	                        </select>
	                        
                      </div>
                       <div class="col-lg-4" style="text-align:center;margin-bottom: 0.5%; margin-top: -0.5%; padding-left: 0px;">
                        <label>           </label><br>
                                        <img style="height: 30px;"  src="${pageContext.request.contextPath}/images/Product_List.png" onclick="getallProductsByCriteria('','','0')" style="cursor: pointer;" >
                                        </div>
                      </div>
	</div>
	
	
			
	
		  <div class="table-responsive" style="overflow-x:auto;width:100%">
            <table id="productsList" class="table table-bordered table-hover" >
              <thead style="background-color: #3c8dbc; color: #ffffff">
                <tr>
                <th><div><spring:message code="sl.no.label" /></div></th>
                	<th><spring:message code="skuid.label"/></th>
                	<%-- <th><spring:message code="itemScanCode.label"/></th> --%>
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
                  
                      <th><spring:message code="action.label"/></th>
                      
               </tr>
              </thead>
                
			<tbody style="text-align: center;">
				<c:forEach var="stockRequests" items="${stockRequestsObj.stockRequestItems}" varStatus="theCount">
                     <tr id=dynamicdiv${theCount.count}>
                     <td class="slno" id="sno${theCount.count}">${theCount.count}</td>
                       <input type="hidden"  value="${stockRequests.approvedQty}"/> 
                         <input type="hidden" id="skuId${theCount.count}" value="${stockRequests.skuId}"/> 
                           <input type="hidden" id="pluCode${theCount.count}" value="${stockRequests.pluCode}"/> 
                           		<input type="hidden" id="category${theCount.count}" value="${stockRequests.category}"/>
              									<input type="hidden" id="brandCode${theCount.count}" value="${stockRequests.brand}"/>
              									<input type="hidden" id="productRange${theCount.count}" value="${stockRequests.productRange}"/>
              									<input type="hidden" id="measureRange${theCount.count}" value="${stockRequests.measurementRange}"/>
              									<input type="hidden" id="ean${theCount.count}" value="${stockRequests.ean}"/>
              									<input type="hidden" id="utility${theCount.count}" value="${stockRequests.utility}"/>
                     <input type='hidden' id="trackingRequired${theCount.count}" class="trackingRequired" value="${stockRequests.trackingRequired}"/>
                      <td id="Name${theCount.count}">${stockRequests.skuId}</td>
                        <%-- <td id="itemScanCode${theCount.count}" class="itemScanCode"  contenteditable='true'>${stockRequests.itemScanCode}</td> --%>
                        
	<td  id="Desc${theCount.count}"><div id="overflowtext"> <a href="#" data-toggle="tooltip"  title="${stockRequests.itemDesc}">${stockRequests.itemDesc}</a></div></td>    
                        
                        
<%--                          <td id="Desc${theCount.count}">${stockRequests.itemDesc}</td>
 --%>                         <td id="UOM${theCount.count}">${stockRequests.uom}</td>
                           <td id="colour${theCount.count}">${stockRequests.color}</td>
                         <td id="size${theCount.count}">${stockRequests.size}</td>
                         <td class="Price" id="Price${theCount.count}" >${stockRequests.itemPrice}</td>
                           
                           <td class="Qoh" id="Qoh${theCount.count}" >${stockRequests.avlQty}</td>
                             <td class="PrvQty" id="PrvQty${theCount.count}" >${stockRequests.prvIndentQty}</td>
                       
                         <td style="border: 1px solid #ccc;padding:0px;">
                         <input style="border: none;height: 100%;text-align: center;" readonly id="Pack${theCount.count}"  onkeypress="return (this.innerText.length < 10)" type="number" value="${stockRequests.quantity}" />
                         </td>
                         
                       
                         <td style="border: 1px solid #ccc;padding:0px;">
                          <input style="border: none;height: 100%;text-align: center;" id="approvedQty${theCount.count}" onblur="changeApproved(this);" type="number" value="${stockRequests.approvedQty}" /></td>
                         
                       
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
                          
                           <td id="Cost${theCount.count}">${fn:replace(totalcost, ",", "")}</td>
                         <td id="Del${theCount.count}" ><img id="Img${theCount.count}" src='${pageContext.request.contextPath}/images/itemdelete.png' style='width:12%;cursor:pointer;' onclick='deleteItem(this);' title="Delete"/></td>
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
	                     <input type="text" class="form-control" id ="shippingCost" readonly name="shippingCost"  value="${stockRequestsObj.shippingCost}"/>
	              </div>
	       </div>
	       
	        <div class="row">
	              <div class="form-group col-lg-8"></div>   
	              <div class="form-group col-lg-3" style="text-align: right;"> <label><spring:message code="total.cost.for.stock.request" /></label></div>
	              <div class="form-group col-lg-1">
	              <c:set var="qtyissued" value="0" scope="page" />
	              <c:forEach var="summaryList" items="${stockRequestsObj.stockRequestItems}" varStatus="thecount">
	                       <c:choose>
              <c:when test="${flowUnder=='warehouse'}">
				<c:set var="qtyissued" value="${qtyissued+((summaryList.approvedQty)*(summaryList.itemPrice))}" scope="page" />
				</c:when>
				<c:otherwise>
				<c:set var="qtyissued" value="${qtyissued+((summaryList.quantity)*(summaryList.itemPrice))}" scope="page" />
				</c:otherwise>
				</c:choose>
					</c:forEach>
					<fmt:formatNumber groupingUsed="false" var="qtyissued" type="number" minFractionDigits="2" maxFractionDigits="2" value="${qtyissued}" />
	                     <input type="text" class="form-control"  id="totalCost" readonly name="shipmentCharges"  value="${qtyissued}"/>
	              </div>
	       </div>
	       <div class="row">
              <div class="form-group col-lg-12">
                      <label><spring:message code="order.remarks.label" /></label>
                       <textarea class="form-control" onblur="criteria(this)" id="remarks" name="remarks" rows="2" style="resize: none;">${stockRequestsObj.remarks}</textarea>
               </div>
           </div>
           
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
          <div class="modal fade popup-display" id="items-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content"style="width: fit-content;">
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
                              <th>Batch Number</th>
                             <th>Expiry Date</th>
                             <th><spring:message code="price.label"/></th>
                              <th><spring:message code="color.label"/></th>
                              <th><spring:message code="size.label"/></th>
                              <th>Quantity In Hand</th>
                              
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
 
  <div class="col-lg-3">
                                         	 <div id="triggerEvent"></div>
                                         </div>
		<div class="row">
       	  <div class="col-lg-12" style="text-align: center;">
           	<%-- <c:forEach var="activity" items="${stockRequestsObj.nextActivities}">														
			 	<input type="button" style="margin-right:1%;width: 80px;position: relative;" class="btn bg-olive btn-inline" onclick="validateStockIssue('${activity}','update','${stockIssueDetails.goods_issue_ref_num}','${stockIssueDetails.id_goods_issue}');" value="${activity}" />
			 </c:forEach> --%>
	       <input type="button" style="" class="btnCls" onclick="validateStockRequest('edit','${stockRequestsObj.stockRequestId}');" value="&nbsp;&nbsp;<spring:message code="submit.label" />&nbsp;&nbsp;" />
			 
       		<input type="button" style="" class="btnCls buttonMargin" onclick="searchStockRequests('','Cancel','0');" value="<spring:message code="cancel.label" />" />
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