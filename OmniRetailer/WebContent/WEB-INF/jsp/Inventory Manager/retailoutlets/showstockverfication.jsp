<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<br>
                   <c:if test="${sessionScope.role == 'super admin'}">
                    <div class="row">
                   	<div class="col-lg-2 form-group" style="text-align: right;">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewAllStockReceipts('stockReceipt','all','0','outlet');" title="<spring:message code="goodsreceipts.label" />">
                   			<img src="${pageContext.request.contextPath}/images/OutletStockReceipt.png" style="margin-top: 10px;"><br>
                   			<span><spring:message code="goodsreceipts.label" /></span>
                   		</div>
                		</div>
                		<div class="col-lg-2 form-group" style="text-align: right;">
	                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewStockVerification('outletStockVerification','0','outlet','menu','');" title="Verificaton Masters ">
	                   			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br>
	                   			<span>Verfication Masters</span>
	                   		</div>
                		</div>
                		<div class="col-lg-2 form-group" style="text-align: right;">
	                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewWarehouseStockVerification('outletStockVerificationReport','0','outlet','menu','','');" title="<spring:message code="goodsreceipts.label" />">
	                   			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br>
	                   			<span>Verifications</span>
	                   		</div>
                		</div>
                    </div>
                  </c:if>
                   <c:if test="${sessionScope.role != 'super admin'}">
                    <div class="row">
                    <c:set var="outletStockVerification" value="false"/> 
     				<c:forEach var="accessControl" items="${sessionScope.outletStockVerification}">
      				<c:if test="${accessControl.appSubDocument == 'OutletStockVerification' && accessControl.read == true}"> 
      					<c:set var="outletStockVerification" value="true"/> 
                   		<div class="col-lg-2 form-group" style="text-align: right;">
	                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewStockVerification('outletStockVerification','0','outlet','menu','');" title="Verificaton Masters ">
	                   			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br>
	                   			<span>Verfication Masters</span>
	                   		</div>
                		</div>
                	   </c:if>
                   </c:forEach>	
                       <c:forEach var="accessControl" items="${sessionScope.outletStockVerification}">
	                  <c:if test="${accessControl.appSubDocument == 'StoreStockVerification' && accessControl.read == true}"> 
	                    <c:set var="storeStockVerification" value="true"/> 
                   		<div class="col-lg-2 form-group" style="text-align: right;">
	                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewWarehouseStockVerification('outletStockVerificationReport','0','outlet','menu','','');" title="Verifications">
	                   			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br>
	                   			<span>Verifications</span>
	                   		</div>
                		</div>
                	   </c:if>
                   </c:forEach>	
                   
                    <c:forEach var="accessControl" items="${sessionScope.outletStockVerification}">
	                 <c:if test="${accessControl.appSubDocument == 'StoreStockVerificationPosting' && accessControl.read == true}"> 
	                    <c:set var="storeStockVerification" value="true"/> 
                   		<div class="col-lg-2 form-group" style="text-align: right;">
	                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOutletStockUploading('outletStockUploading','0','outlet','menu','','');" title="Stock Posting">
	                   			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br>
	                   			<span>Stock Posting</span>
	                   		</div>
                		</div>
                	   </c:if>
                   </c:forEach>	
                   
                   	
                    </div>
                  </c:if>
</body>
</html>