<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.calendars.picker.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.plus.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.calendars.picker.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	/* callCalender('from');
	callCalender('to'); */
});
</script>
</head>
<body>
<div class="box-body table-responsive" >
<%-- <div class="row">
	        <div class="col-lg-3">
               <div class="row">
                 <div class="col-lg-4 col-xs-4 col-sm-2 col-md-2" style="text-align:left;top:5px;padding-right: 0px;">
                   <label><spring:message code="location.label"/></label>
                 </div>
                 <div class="col-lg-8 col-xs-8 col-sm-10 col-md-10" style="padding-left: 0px;">
                 <select class="form-control form-group" id="toLocation" onchange="searchPurchases('','','0')">
                          <option value=""><spring:message code="ALL.label"/></option>
                            <c:forEach var="location" items="${workLocationsList}">
						<option value="${location}" ${location == selectedLocation ? 'selected' : ''} id="${location}">${location}</option>
					 </c:forEach>
                </select>
                 </div>
	        	</div>
	        </div>
	        <div class="col-lg-2"></div>
	        <div class="col-lg-3">
              <div class="row">
                	<div class="col-lg-4 col-xs-4 col-sm-2 col-md-2" style="text-align:left;top:5px;padding-right: 0px;">
                 		<label><spring:message code="offer_start_date.label"/></label>
	                 </div>
                	 <div class="col-lg-8 col-xs-8 col-sm-10 col-md-10" style="padding-left: 0px;">
                	 	<input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="from" size="20" type="text" onfocus="callCalender('from')" onclick="callCalender('from')" placeholder="DD/MM/YYYY" />
                	 </div>
	              </div>
	            </div>
	            <div class="col-lg-3">
	               <div class="row">
	                 <div class="col-lg-4 col-xs-4 col-sm-2 col-md-2" style="text-align:left;top:5px;padding-right: 0px;">
	                   <label><spring:message code="offer_end_date.label"/></label>
	                 </div>
	                 <div class="col-lg-8 col-xs-8 col-sm-10 col-md-10" style="padding-left: 0px;">
	                 	<input class="form-control calendar_icon form-group" readonly="readonly" value="" style="background-color: white;" id="to" size="20" type="text" onfocus="callCalender('to')" onclick="callCalender('to')" placeholder="DD/MM/YYYY" />
                	  </div>
		           </div>
		          </div>
	           <div class="col-lg-1" style="">
	                <input type="button" style="padding: 4px 8px;" class="btn bg-olive btn-inline" onclick="getCustomerPurchaseDetails('${phoneNo}','0')" value="<spring:message code="search" />" />
	           </div>
		      </div> --%>
        	 <div class="row">
                  <div class="col-lg-1 col-xs-2">
                   	<select class="form-control" id="purchaseMaxRecords" style="padding: 3px 4px;" onchange="getCustomerPurchaseDetails('${phoneNo}','0');">
                   		<option value="10" ${purchaseMaxRecords == '10' ? 'selected' : ''}>10</option>
                   		<option value="25" ${purchaseMaxRecords == '25' ? 'selected' : ''}>25</option>
                   		<option value="50" ${purchaseMaxRecords == '50' ? 'selected' : ''}>50</option>
                  		<option value="100" ${purchaseMaxRecords == '100' ? 'selected' : ''}>100</option>
                   	</select>
                   </div>
                  <div class="col-lg-11 col-xs-10">
                   	 <input type="text" oninput="getCustomerPurchaseDetails('${phoneNo}','0');" class="form-control" style="text-align: center;height:30PX;border-radius: 6px !important;background:url(${pageContext.request.contextPath}/images/search.png) no-repeat;background-position:right;" value="${searchName}" id="searchPurchases" placeholder="<spring:message code="search.purchases.label" />" />
					<%-- <input type="hidden" id="customersSearch" value="${searchName}"> --%>
                 </div>
               </div>
             <table id="example2" class="table table-bordered table-striped" style="">
                 <thead style="background-color: #3c8dbc; color: #ffffff">
                     <tr>
                     	<th><div ><spring:message code="s.no.label" /></div></th>
                         <th><spring:message code="billing_id.label" /></th>
                         <th><spring:message code="skuid.label" /></th>
                         <th><spring:message code="item_name.label" /></th>
                         <th><spring:message code="location.label" /></th>
                         <th><spring:message code="grade.label" /></th>
                          <th><spring:message code="color.label" /></th>
                          <th><spring:message code="deal.image.size.label" /></th>
                           <th><spring:message code="date.label" /></th>
                            <th><spring:message code="price.label" /></th>
                         <th><spring:message code="quantity.label" /></th>
                         <th><spring:message code="total_bill.label" /></th>
                     </tr>
                 </thead>
                 <tbody style="text-align: center;">
		            <c:forEach var="purchaseDetails" items="${purchaseList}" varStatus="theCount">
		             <c:if test="${theCount.last}">
		             <tr style="border-bottom: 2px solid #ccc;">
		                <td>${purchaseDetails.slNo}</td>
		                 <td>${purchaseDetails.billId}</td>
		                 <td>${purchaseDetails.sku_id}</td>
		                 <td>${purchaseDetails.item_name}</td>
		                 <td>${purchaseDetails.storeLocation}</td>
		                 <td>${purchaseDetails.productRange}</td>
		                 <td>${purchaseDetails.color}</td>
		                 <td>${purchaseDetails.size}</td>
		                 <td>${purchaseDetails.billedDate}</td>
		                 <td>${purchaseDetails.itemUnitPrice}</td>
		                 <td>${purchaseDetails.quantity}</td>
		                 <td>${purchaseDetails.item_total_price}</td>
					</tr>
					</c:if>
					
					 <c:if test="${!theCount.last}">
		             <tr>
		                <td>${purchaseDetails.slNo}</td>
		                 <td>${purchaseDetails.billId}</td>
		                 <td>${purchaseDetails.sku_id}</td>
		                 <td>${purchaseDetails.item_name}</td>
		                 <td>${purchaseDetails.storeLocation}</td>
		                 <td>${purchaseDetails.productRange}</td>
		                 <td>${purchaseDetails.color}</td>
		                 <td>${purchaseDetails.size}</td>
		                 <td>${purchaseDetails.billedDate}</td>
		                 <td>${purchaseDetails.itemUnitPrice}</td>
		                 <td>${purchaseDetails.quantity}</td>
		                 <td>${purchaseDetails.item_total_price}</td>
					</tr>
					</c:if>
					
					
					 <c:set var="dataExists" value="true"></c:set>
		            </c:forEach>
		              <c:if test="${dataExists == 'true'}">
                                   <tr>   
                                        <c:set var="quantity" value="0"  />
                                         <c:set var="totalPrice" value="0"  />
                                           	        
                                           	      
                                           	 <c:forEach var="salesReport" items="${purchaseList}" >
                                           	 <fmt:formatNumber var="quantity" groupingUsed="false" type="number" minFractionDigits="3" maxFractionDigits="3" value="${quantity+((salesReport.quantity))}" />
                                           	  <fmt:formatNumber var="totalPrice" groupingUsed="false" type="number" minFractionDigits="3" maxFractionDigits="3" value="${totalPrice+((salesReport.item_total_price))}" />
                                           	
                                           	 </c:forEach>
                                           		<td></td><td></td><td></td><td></td>
                                           		 <td></td>
		                                         <td></td>
		                                          <td></td>
		                                         <td></td>
		                                        <td></td>
		                                         <td></td>
                                                <td>${quantity}</td>
                                                <td>${totalPrice}</td>
                                           </tr>
                                          </c:if>
           		</tbody>
              </table>
              <div class="row">
              	<c:if test="${index-1 == 0 && totalRecords >purchaseMaxRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="getCustomerPurchaseDetails('${phoneNo}','${totalValue}')">
              	</div>									
              	</c:if>
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-purchaseMaxRecords >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return getCustomerPurchaseDetails('${phoneNo}','${index - (purchaseMaxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-purchaseMaxRecords <= 0}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return getCustomerPurchaseDetails('${phoneNo}','${index - (purchaseMaxRecords + 1)}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="getCustomerPurchaseDetails('${phoneNo}','${totalValue}')">
              	</div> 
              	</c:if>
              </div>


</div>
<script type="text/javascript">
     $(function() {
         $('#example2').dataTable({
        	 "bPaginate": false,
             "bLengthChange": false,
             "bFilter": false,
             "bSort": false,
             "bInfo": false,
             "bAutoWidth": false
         });
     });
 </script>
</body>
</html>