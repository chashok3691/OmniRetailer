

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
       
    </head>
<body>
                            <br>
                          <c:if test="${sessionScope.role == 'super admin'}">
                          <div class="row">
                          	<div class="col-lg-2 form-group">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletStocks('NormalStock','Normal','0','outlet','menu');" title="<spring:message code="availablestock.label" />">
                          			<img src="${pageContext.request.contextPath}/images/NormalStock.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="availablestock.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2 form-group" style="text-align: left;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletStocks('OrderedStock','Ordered','0','outlet','menu');" title="<spring:message code="orderedstock.label" />">
                          			<img src="${pageContext.request.contextPath}/images/OrderedStock.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="orderedstock.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2 form-group" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletStocks('CriticalStock','Critical','0','outlet','menu');" title="<spring:message code="criticalstock.label" />">
                          			<img src="${pageContext.request.contextPath}/images/CriticalStock.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="criticalstock.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2 form-group" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletStocks('BlockedStock','Blocked','0','outlet','menu');" title="<spring:message code="blockedstock.label" />">
                          			<img src="${pageContext.request.contextPath}/images/BlockedStock.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="blockedstock.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2 form-group" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletStocks('ReturnedStock','Returned','0','outlet','menu');" title="<spring:message code="returnedstock.label" />">
                          			<img src="${pageContext.request.contextPath}/images/ReturnedStock.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="returnedstock.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2 form-group" style="text-align: left;">
                          	
                          	</div>
                          
                          </div>
                          <br>
                          <br>
                        <div class="row">
                          	<div class="col-lg-2 form-group" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletStocks('BoneyardStock','Boneyard','0','outlet','menu');" title="<spring:message code="boneyard.label" />">
                          			<img src="${pageContext.request.contextPath}/images/BoneyardStock.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="boneyard.label" /></span>
                          		</div>
                          	</div>
                          	</div>     
                        </c:if>  
                        <c:if test="${sessionScope.role != 'super admin'}">
                         <c:set var="noOfCols" value="0"/>
                          <div class="row">
                          
                          <c:forEach var="accessControl" items="${sessionScope.outletStocks}">
	                        <c:if test="${accessControl.appSubDocument == 'OutletAvailableStock' && accessControl.read == true}"> 
	                        <c:set var="noOfCols" value="${noOfCols + 1}" />
                          	<div class="col-lg-2 form-group" style="text-align: left;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewDailyStockTracker('OutletDailyStockTracker','0','outlet','menu');" title="Stock History">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Stock History</span>
                          		</div>
                          	</div>
                          	</c:if>
                         </c:forEach>
                          
                          <c:forEach var="accessControl" items="${sessionScope.outletStocks}">
	                        <c:if test="${accessControl.appSubDocument == 'OutletAvailableStock' && accessControl.read == true}"> 
	                        <c:set var="noOfCols" value="${noOfCols + 1}" />
                          	<div class="col-lg-2 form-group">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletStocks('NormalStock','Normal','0','outlet','menu');" title="<spring:message code="availablestock.label" />">
                          			<img src="${pageContext.request.contextPath}/images/NormalStock.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="availablestock.label" /></span>
                          		</div>
                          	</div>
                          	</c:if>
                          </c:forEach>
                          <c:forEach var="accessControl" items="${sessionScope.outletStocks}">
	                        <c:if test="${accessControl.appSubDocument == 'OutletOrderedStock' && accessControl.read == true}"> 
	                        <c:set var="noOfCols" value="${noOfCols + 1}" />
                          	<div class="col-lg-2 form-group" style="text-align: left;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletStocks('OrderedStock','Ordered','0','outlet','menu');" title="<spring:message code="orderedstock.label" />">
                          			<img src="${pageContext.request.contextPath}/images/OrderedStock.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="orderedstock.label" /></span>
                          		</div>
                          	</div>
                          	</c:if>
                         </c:forEach>
                         <c:forEach var="accessControl" items="${sessionScope.outletStocks}">
	                        <c:if test="${accessControl.appSubDocument == 'OutletCriticalStock' && accessControl.read == true}">
	                        <c:set var="noOfCols" value="${noOfCols + 1}" />
                          	<div class="col-lg-2 form-group" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletStocks('CriticalStock','Critical','0','outlet','menu');" title="<spring:message code="criticalstock.label" />">
                          			<img src="${pageContext.request.contextPath}/images/CriticalStock.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="criticalstock.label" /></span>
                          		</div>
                          	</div>
                          	</c:if>
                        </c:forEach>
                        <c:forEach var="accessControl" items="${sessionScope.outletStocks}">
	                      <c:if test="${accessControl.appSubDocument == 'OutletBlockedStock' && accessControl.read == true}"> 
	                      <c:set var="noOfCols" value="${noOfCols + 1}" />
                          	<div class="col-lg-2 form-group" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletStocks('BlockedStock','Blocked','0','outlet','menu');" title="<spring:message code="blockedstock.label" />">
                          			<img src="${pageContext.request.contextPath}/images/BlockedStock.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="blockedstock.label" /></span>
                          		</div>
                          	</div>
                          </c:if>
                        </c:forEach>
                        
                         <c:if test="${noOfCols == 5}">
                          			<div class="col-lg-2 form-group" style="text-align: left;"></div>
                          		</div>
	                        	<div class="row">
		                    </c:if>
                        
                        <c:forEach var="accessControl" items="${sessionScope.outletStocks}">
	                       <c:if test="${accessControl.appSubDocument == 'OutletReturnedStock' && accessControl.read == true}"> 
	                       <c:set var="noOfCols" value="${noOfCols + 1}" />
                          	<div class="col-lg-2 form-group" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletStocks('ReturnedStock','Returned','0','outlet','menu');" title="<spring:message code="returnedstock.label" />">
                          			<img src="${pageContext.request.contextPath}/images/ReturnedStock.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="returnedstock.label" /></span>
                          		</div>
                          	</div>
                          </c:if>
                       </c:forEach>
                          <c:if test="${noOfCols == 5}">
                          			<div class="col-lg-2 form-group" style="text-align: left;"></div>
                          		</div>
	                        	<div class="row">
		                    </c:if>
                        <c:forEach var="accessControl" items="${sessionScope.outletStocks}">
	                      <c:if test="${accessControl.appSubDocument == 'OutletBoneyardStock' && accessControl.read == true}"> 
	                      <c:set var="noOfCols" value="${noOfCols + 1}" />
                          	<div class="col-lg-2 form-group" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletStocks('BoneyardStock','Boneyard','0','outlet','menu');" title="<spring:message code="boneyard.label" />">
                          			<img src="${pageContext.request.contextPath}/images/BoneyardStock.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="boneyard.label" /></span>
                          		</div>
                          	</div>
                          </c:if>
                        </c:forEach>
                          	</div>     
                        </c:if>  
                    
                          
</body>
</html>