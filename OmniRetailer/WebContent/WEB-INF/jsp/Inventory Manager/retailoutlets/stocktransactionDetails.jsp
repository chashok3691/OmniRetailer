

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
                               <c:if test="${flowUnder == 'outlet'}">  
                                    <th><spring:message code="sold.quantity" /></th>
                                     <th><spring:message code="return.qty.label" /></th>
                                      <th><spring:message code="exchange.qty.label" /></th>
                                   </c:if> 
                                    <th><spring:message code="transferred.qty.label" /></th>
                                    <th><spring:message code="receiptstock.label" /></th>
                                    <th><spring:message code="stock.return.quantity.label" /></th>
                                    <th><spring:message code="grn.quantity.label"/></th>
                                     <th><spring:message code="dump.qty.label" /></th>
                                    <th><spring:message code="net.stock.label" /></th>
                                  
                                </tr>
                            
                            
                                
                                                        </thead>
                            
                            <tbody style="text-align: center;">
                             <c:forEach var="stockLedgerDetails" items="${stockLedgerDetailsList}" varStatus="status">
                          	 <tr>
                                  <td>${status.count}</td>
                                  <td>${stockLedgerDetails.strDate}</td>
                                <c:if test="${flowUnder == 'outlet'}"> 
                                  <fmt:formatNumber var="soldQuantity" type="number" minFractionDigits="2" maxFractionDigits="2" value="${stockLedgerDetails.soldQuantity}" />
                                  <td>${soldQuantity}</td>
                                  <td>
                                    ${empty stockLedgerDetails.returnedQty ? 0.0 : stockLedgerDetails.returnedQty}
                                 </td>
                                  <td>
                                  ${empty stockLedgerDetails.exchangedQty ? 0.0 : stockLedgerDetails.exchangedQty}
                                  </td>
                                  </c:if>
                               
                                  <fmt:formatNumber var="transferedQuantity" type="number" minFractionDigits="2" maxFractionDigits="2" value="${stockLedgerDetails.transferedQuantity}" />
                                  <td>${transferedQuantity}</td>
                                  <fmt:formatNumber var="stockReceipts" type="number" minFractionDigits="2" maxFractionDigits="2" value="${stockLedgerDetails.stockReceipts}" />
                                  <td>${stockReceipts}</td>
                                  <td>
                                    ${empty stockLedgerDetails.stockReturnedFromLocQty ? 0.0 : stockLedgerDetails.stockReturnedFromLocQty}
                                 </td>
                                  <fmt:formatNumber var="grnQty" type="number" minFractionDigits="2" maxFractionDigits="2" value="${stockLedgerDetails.grnQty}" />
                                  <td>${grnQty}</td>
                                  <td>
                                  ${empty stockLedgerDetails.dumpQty ? 0.0 : stockLedgerDetails.dumpQty}
                                  </td>
                                  <fmt:formatNumber var="netStock" type="number" minFractionDigits="2" maxFractionDigits="2" value="${stockLedgerDetails.netStock}" />
                                  <td>${netStock}</td>
                                   <c:set var ="netStock" value="${stockLedgerDetails.netStock}"></c:set>
                                  <c:if test="${status.first}">
                                  <c:set var="firstNetStock" value="${netStock}"  />
                                  </c:if>
                                  
                                  <c:if test="${status.last}">
                                  <c:set var="lastNetStock" value="${netStock}"  />
                                  </c:if>
                                
                              </tr>
                              
                              <c:set var="dataExists" value="true"></c:set>
                             </c:forEach>
 
                             
                       
                         <c:if test="${fn:length(stockLedgerDetailsList) eq 1}">
   									<c:set var="total" value="${0}"  />
								</c:if>
								 <c:if test="${fn:length(stockLedgerDetailsList) gt 1}">
   									<c:set var="total" value="${firstNetStock-lastNetStock}"  />
								</c:if>

                       
                       
                       
                        <c:if test="${flowUnder == 'outlet'}"> 
                        
                               <c:if test="${dataExists == 'true'}">
                                 
                  
                                           	<tr style="text-align:center">
                                           	        <c:set var="soldQty" value="0"  />
                                           	         <c:set var="transferredQty" value="0"  />
                                           	         <c:set var="inwardQty" value="0"  />
                                           	      <c:set var="totalCost" value="0"  />
                                           	       <c:set var="grntotal" value="0"  />
                                           	       <c:set var="stockvariation" value="0"  />
                                           	        <c:set var="returnqty" value="0"  />
                                           	         <c:set var="exchangeqty" value="0"  />
                                           	          <c:set var="stockreturnqty" value="0"  />
                                           	           <c:set var="dumpqty" value="0"  />
                                           	      
                                           	 <c:forEach var="stockLedger" items="${stockLedgerDetailsList}" >
                                           <%-- 	 <c:set var="soldQty" value="${soldQty+((stockLedger.soldQuantity))}" scope="page" /> --%>
                                           	 <%-- <c:set var="transferredQty" value="${transferredQty+((stockLedger.transferedQuantity))}" scope="page" /> --%>
                                           	 <%-- <fmt:formatNumber var="soldQty" type="number" minFractionDigits="2" maxFractionDigits="2" value="${soldQty+((stockLedger.soldQuantity))}" />
                                           	 <fmt:formatNumber var="transferredQty" type="number" minFractionDigits="2" maxFractionDigits="2" value="${transferredQty+((stockLedger.transferedQuantity))}" />
                                              <fmt:formatNumber var="inwardQty" type="number" minFractionDigits="2" maxFractionDigits="2" value="${inwardQty+((stockLedger.stockReceipts))}" />
                                            <fmt:formatNumber var="grntotal" type="number" minFractionDigits="2" maxFractionDigits="2" value="${grntotal+((stockLedger.grnQty))}" /> --%>
                                           	 <%-- <c:set var="inwardQty" value="${inwardQty+((stockLedger.stockReceipts))}" scope="page" />--%>
                                           	 <c:set var="soldQty" value="${soldQty+((stockLedger.soldQuantity))}" scope="page" /> 
                                           	 <c:set var="transferredQty" value="${transferredQty+((stockLedger.transferedQuantity))}" scope="page" /> 
                                           	 <c:set var="inwardQty" value="${inwardQty+((stockLedger.stockReceipts))}" scope="page" /> 
                                           	 <c:set var="grntotal" value="${grntotal+((stockLedger.grnQty))}" scope="page" /> 
                                           	 <c:set var="stockvariation" value="${totalCost+((stockLedger.netStock))}" scope="page" /> 
                                           	 <c:set var="returnqty" value="${returnqty+((stockLedger.returnedQty))}" scope="page" /> 
                                           	 <c:set var="exchangeqty" value="${exchangeqty+((stockLedger.exchangedQty))}" scope="page" /> 
                                           	 <c:set var="stockreturnqty" value="${stockreturnqty+((stockLedger.stockReturnedFromLocQty))}" scope="page" /> 
                                           	 <c:set var="dumpqty" value="${dumpqty+((stockLedger.dumpQty))}" scope="page" /> 
                                           	
                                           	 </c:forEach>
                                            	 <td></td>
                                    <td></td>
                                    <fmt:formatNumber var="soldQty" type="number" minFractionDigits="2" maxFractionDigits="2" value="${soldQty}" />
                                  <td  style="padding:3px;width: 205px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${soldQty}</div></td>
                                  <fmt:formatNumber var="returnqty" type="number" minFractionDigits="2" maxFractionDigits="2" value="${returnqty}" />
                                  <td style="padding:3px;width: 205px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${returnqty}</td>
                                  <fmt:formatNumber var="exchangeqty" type="number" minFractionDigits="2" maxFractionDigits="2" value="${exchangeqty}" />
                                  <td style="padding:3px;width: 205px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${exchangeqty}</td>
                                       <td style="padding:3px;width: 205px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${transferredQty}</div></td>
                                       <td style="padding:3px;width: 205px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${inwardQty}</div></td>
                                       <fmt:formatNumber var="stockreturnqty" type="number" minFractionDigits="2" maxFractionDigits="2" value="${stockreturnqty}" />
                                       <td style="padding:3px;width: 205px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${stockreturnqty}</td>
                                       <fmt:formatNumber var="grntotal" type="number" minFractionDigits="2" maxFractionDigits="2" value="${grntotal+((stockLedger.grnQty))}" />
                                        <td style="padding:3px;width: 205px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${grntotal}</div></td>
                                        <fmt:formatNumber var="dumpqty" type="number" minFractionDigits="2" maxFractionDigits="2" value="${dumpqty}" />
                                        <td style="padding:3px;width: 205px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${dumpqty}</td>
<%-- <td style="padding:3px;width: 205px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;width:">${stockvariation}</div></td> --%>

							<c:if test="${total==0}">
							 <%--  <fmt:formatNumber var="total" type="number" minFractionDigits="2" maxFractionDigits="2" value="${total}" /> --%>
                           <td style="padding:3px;width: 205px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;width:">${total*(-1)}</div></td>
                           </c:if>
							 <c:if test="${total<0}">
							 	<%--   <fmt:formatNumber var="total" type="number" minFractionDigits="2" maxFractionDigits="2" value="${total}" /> --%>
                           <td style="padding:3px;width: 205px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;width:">${total*(-1)}</div></td>
                           </c:if>
                           <c:if test="${total>0}">
                           	<%--   <fmt:formatNumber var="total" type="number" minFractionDigits="2" maxFractionDigits="2" value="${total}" /> --%>
                           <td style="padding:3px;width: 205px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;width:">${total}</div></td>
                           </c:if>
                                       <%--      	
                                            <td></td>
                                           <td></td>
                                                 <td>${soldQty}</td> 
                                                <td>${transferedQuantity}</td>
                                                <td>${inwardQty}</td>
                                                <td>${stockvariation}</td> --%>
                                            </tr>
                                          </c:if>
                  
                  </c:if>
                 
                  <c:if test="${flowUnder == 'warehouse'}"> 
                      
                      
                 <!-- <table id="stockLedger" class="table" style="    border-collapse: inherit !important;" > -->
                  
                  
                               <c:if test="${dataExists == 'true'}">
                              
                  
                                           	<tr style="text-align:center">
                                           	        <c:set var="soldQty" value="0"  />
                                           	         <c:set var="transferredQty" value="0"  />
                                           	         <c:set var="inwardQty" value="0"  />
                                           	      <c:set var="totalCost" value="0"  />
                                           	        <c:set var="grntotal" value="0"  />
                                           	       <c:set var="stockvariation" value="0"  />
                                           	        <c:set var="stockreturnqty" value="0"  />
                                           	           <c:set var="dumpqty" value="0"  />
                                           	 <c:forEach var="stockLedger" items="${stockLedgerDetailsList}" >
                                           <%-- 	 <c:set var="soldQty" value="${soldQty+((stockLedger.soldQuantity))}" scope="page" /> --%>
                                           	 <%-- <c:set var="transferredQty" value="${transferredQty+((stockLedger.transferedQuantity))}" scope="page" /> --%>
                                           	 <fmt:formatNumber var="transferredQty" type="number" minFractionDigits="2" maxFractionDigits="2" value="${transferredQty+((stockLedger.transferedQuantity))}" />
                                              <fmt:formatNumber var="inwardQty" type="number" minFractionDigits="2" maxFractionDigits="2" value="${inwardQty+((stockLedger.stockReceipts))}" />
                                            <fmt:formatNumber var="grntotal" type="number" minFractionDigits="2" maxFractionDigits="2" value="${grntotal+((stockLedger.grnQty))}" />
                                           	 <%-- <c:set var="inwardQty" value="${inwardQty+((stockLedger.stockReceipts))}" scope="page" />--%>
                                           	 <c:set var="stockvariation" value="${totalCost+((stockLedger.netStock))}" scope="page" /> 
                                           		 <c:set var="stockreturnqty" value="${stockreturnqty+((stockLedger.stockReturnedFromLocQty))}" scope="page" /> 
                                           	 <c:set var="dumpqty" value="${dumpqty+((stockLedger.dumpQty))}" scope="page" /> 
                                           	 </c:forEach>
                                     <td></td>
									<td></td>
                                       <td style="padding:3px;width: 205px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${transferredQty}</div></td>
                                       <td style="padding:3px;width: 205px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${inwardQty}</div></td>
                                       <fmt:formatNumber var="stockreturnqty" type="number" minFractionDigits="2" maxFractionDigits="2" value="${stockreturnqty}" />
                                              	  <td style="padding:3px;width: 205px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${stockreturnqty}</td>
                                              	  <fmt:formatNumber var="grntotal" type="number" minFractionDigits="2" maxFractionDigits="2" value="${grntotal+((stockLedger.grnQty))}" />
                                    <td style="padding:3px;width: 205px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${grntotal}</td>
                                    <fmt:formatNumber var="dumpqty" type="number" minFractionDigits="2" maxFractionDigits="2" value="${dumpqty}" />
                                     <td style="padding:3px;width: 205px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;">${dumpqty}</td>


                            <c:if test="${total<0}">
                           <td style="padding:3px;width: 205px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;width:">${total*(-1)}</div></td>
                           </c:if>
                           <c:if test="${total>0}">
                           <td style="padding:3px;width: 205px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;width:">${total}</div></td>
                           </c:if>
                              <c:if test="${total==0}">
                           <td style="padding:3px;width: 205px;"><div style="white-space: nowrap;padding: 5px;background: #c1c1c1;width:">${total}</div></td>
                           </c:if>
                             	
                                          <%--   <td></td>
                                           <td></td>
                                                 <td>${soldQty}</td> 
                                                <td>${transferedQuantity}</td>
                                                <td>${inwardQty}</td>
                                                <td>${stockvariation}</td>  --%>
                                            </tr>
                                          </c:if>
                  
                  </c:if>
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
                              


</body>
</html>