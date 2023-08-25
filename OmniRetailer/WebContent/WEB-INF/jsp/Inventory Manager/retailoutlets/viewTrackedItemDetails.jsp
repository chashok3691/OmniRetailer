

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
                                	<th><spring:message code="itemTrack.lanel" /> &nbsp;Id</th>
                                </tr>
                            </thead>
                            <tbody style="text-align: center;">
                            <%--  <c:forEach  items="${stockLedgerDetailsList.availItemsList}" > --%>
                         <c:choose>
                         <c:when test="${flowUnder == 'outlet'}">
                        
                         <c:forTokens items="${outletstockLedgerDetailsList.availItemsList}" varStatus="status" delims=",[]" var="stockLedgerDetails">
                          <c:if test="${stockLedgerDetails != 'null'}">
                          	 <tr>
                                  <td>${status.count}</td>
                                  <td>${stockLedgerDetails}</td>
                              </tr>
                              <c:set var="dataExists" value="true"></c:set>
                            </c:if>
                             </c:forTokens>
                         </c:when>
                         <c:otherwise>
                          <%--  <c:out value="2"></c:out> --%>
                     <%--    <c:out value="${stockLedgerDetailsList.eansList}"></c:out> --%>
                          <c:forTokens items="${stockLedgerDetailsList.eansList}" varStatus="status" delims=",[]" var="stockitemtrackDetails">
                          <c:if test="${stockitemtrackDetails != 'null'}">
                          	 <tr>
                                  <td>${status.count}</td>
                                  <td>${stockitemtrackDetails}</td>
                              </tr>
                              <c:set var="dataExists" value="true"></c:set>
                            </c:if>
                             </c:forTokens>
                         
                         </c:otherwise>
                         
                         </c:choose>	
                          
                               
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
                     
   
                              


</body>
</html>