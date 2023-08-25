

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  

<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> -->
        <!-- DATA TABLES -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/omniretailer.css">
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        
<title>Insert title here</title>
</head>
<body>

   
                    <div class="box-body table-responsive">
                       <div style="white-space: nowrap;">
				         <table id="stockLedger" class="table table-bordered table-striped">
                            <thead style="background-color: #3c8dbc; color: #ffffff">
                               <tr>
                                	<th><spring:message code="s.no.label" /></th>
                                	<th><spring:message code="counter_date.label" /></th>
                                    <th><spring:message code="openstock.label" /></th>
                                    <th><spring:message code="closestock.label" /></th>
                                   <%--  <th><spring:message code="cost.price.label" /></th> --%>
                                   <%--  <th><spring:message code="saleprice.label" /></th> --%>
                                    <th><spring:message code="costpricaevalue.label" /></th>
                                    <th><spring:message code="salepricaevalue.label" /></th>
                                   <%--  <th><spring:message code="opensaleValue.label"/></th>
                                    <th><spring:message code="closesaleValue.label" /></th> --%>
                                </tr>
                             </thead>
                            
                            <tbody style="text-align: center;">
                             <c:forEach var="stockLedgerDetails" items="${stockLedgerDetailsList}" varStatus="status">
                          	 <tr>
                                  <td>${status.count}</td>
                                  <td>${stockLedgerDetails.date}</td>
                                  <td>${stockLedgerDetails.openStockQty}</td>
                                  <td>${stockLedgerDetails.closedStockQty}</td>
                                <!--   <td></td> -->
                                 <!--  <td></td> -->
                                 <td>${stockLedgerDetails.openStock}</td>
                                 <td>${stockLedgerDetails.closedStock}</td>
                                 <!--  <td></td>
                                  <td></td> -->
                             </tr>
                              <c:set var="dataExists" value="true"></c:set>
                             </c:forEach>
 
                  </table>
				    </div>
                        
                           
                           
                        <!--added by manasa  -->
                       <input type="hidden" id="outletCategory" value="${skuObj.category}">
   <input type="hidden" id="outletBrandId" value="${skuObj.brand}">
    <input type="hidden" id="outletLocation" value="${skuObj.storeLocation}"> 
      <input type="hidden" id="outletSubcategory" value="${skuObj.subCategory}">
       <input type="hidden" id="outletDepartmentId" value="${skuObj.department}">
        <input type="hidden" id="outletSupplierId" value="${skuObj.supplierName}"> 
        <input type="hidden" id="outletZone" value="${skuObj.zone}">
       <input type="hidden" id="from" value="${skuObj.startDate}">
        <input type="hidden" id="to" value="${skuObj.endDate}">
         <input type="hidden" id="outletStartPrice" value="${skuObj.startPriceRange}">
        <input type="hidden" id="outletEndPrice" value="${skuObj.endPriceRange}"> 
         <input type="hidden" id="searchType" value="${skuObj.status}">    
          <input type="hidden" id="searchStocks" value="${skuObj.searchCriteria}">    
            <!--//..added by manasa  -->   
                     
                      
      <%--                 
              <div class="row">
               <input type="hidden" id="flowUnder" value="${flowUnder}">
              	<c:if test="${index-1 == 0 && totalRecords >10}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick=""> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" onclick="stockLedger('${skuId}','${totalValue}','${stockType}')">
              	</div>
              	</c:if>
              	
              	<c:if test="${totalValue == totalRecords}">
              			<c:if test="${totalValue-10 >0}">
              				<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return stockLedger('${skuId}','${index - 11}','${stockType}');"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              		</div>
              			</c:if>
              			<c:if test="${totalValue-10 <= 0}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;"> ${index} - ${totalValue} of ${totalRecords} 
              		<input type="button" class='paginationButton' value="&#62;" >
              	</div>
              	</c:if>
              	</c:if>
              	<c:if test="${index-1 != 0 &&  totalValue != totalRecords}">
              		<div class="form-group col-lg-12" style="text-align: right;">
              		<input type="button" class='paginationButton' value="&#60;" onclick="return stockLedger('${skuId}','${index - 11}','${stockType}');"> ${index} - ${totalValue} of ${totalRecords} .
              		<input type="button" class='paginationButton' value="&#62;" onclick="stockLedger('${skuId}','${totalValue}','${stockType}')">
              	</div> 
              	</c:if>
              </div>   --%>  
       </div>                       


</body>
</html>