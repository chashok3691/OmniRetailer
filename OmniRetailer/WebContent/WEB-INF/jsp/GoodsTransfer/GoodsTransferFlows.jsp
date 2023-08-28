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
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewAllStockIssues('stockIssue','all','0','outlet');" title="<spring:message code="goodsindent.label" />">
                   			<img src="${pageContext.request.contextPath}/images/OutletStockIssue.png" style="margin-top: 10px;"><br>
                   			<span><spring:message code="goodsindent.label" /></span><br>
                   		</div>
                		</div>
                		<div class="col-lg-2 form-group" style="text-align: right;">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewStockRequest('outletStockRequest','0','outlet');" title="<spring:message code="outlet.stock.request.label" />">
                   			<img src="${pageContext.request.contextPath}/images/OutletStockRequest.png" style="margin-top: 10px;"><br>
                   			<span><spring:message code="outlet.stock.request.label" /></span><br>
                   		</div>
                		</div>
                		<div class="col-lg-2 form-group" style="text-align: right;">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewGoodsReturn('outletGoodsReturn','0','','outlet');" title="<spring:message code="goods.return.label" />">
                   			<img src="${pageContext.request.contextPath}/images/OutletStockReturn.png" style="margin-top: 10px;"><br>
                   			<span><spring:message code="goods.return.label" /></span><br>
                   		</div>
                		</div>
                    </div>
                  </c:if>
                   <c:if test="${sessionScope.role != 'super admin'}">
                    <div class="row">
                    <c:set var="outletStockReceipt" value="false"/> 
     				<c:forEach var="accessControl" items="${sessionScope.outletGoodsTransfer}">
      				<c:if test="${accessControl.appSubDocument == 'OutletStockReceipt' && accessControl.write == true && accessControl.read == false}"> 
      					<c:set var="outletStockReceipt" value="true"/> 
                   		<div class="col-lg-2 form-group" style="text-align: right;">
	                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="newStockReceiptView('stockReceipt','outlet');" title="<spring:message code="goodsreceipts.label" />">
	                   			<img src="${pageContext.request.contextPath}/images/OutletStockReceipt.png" style="margin-top: 10px;"><br>
	                   			<span><spring:message code="goodsreceipts.label" /></span>
	                   		</div>
                		</div>
                	   </c:if>
                   </c:forEach>	
                   <c:forEach var="accessControl" items="${sessionScope.outletGoodsTransfer}">
	                   <c:if test="${accessControl.appSubDocument == 'OutletStockReceipt' && outletStockReceipt == false}"> 
                   		<div class="col-lg-2 form-group" style="text-align: right;">
	                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewAllStockReceipts('stockReceipt','all','0','outlet');" title="<spring:message code="goodsreceipts.label" />">
	                   			<img src="${pageContext.request.contextPath}/images/OutletStockReceipt.png" style="margin-top: 10px;"><br>
	                   			<span><spring:message code="goodsreceipts.label" /></span>
	                   		</div>
                		</div>
                	   </c:if>
                   </c:forEach>	
                   <c:set var="outletStockIssue" value="false"/> 
           		<c:forEach var="accessControl" items="${sessionScope.outletGoodsTransfer}">
       				<c:if test="${accessControl.appSubDocument == 'OutletStockIssue' && accessControl.write == true && accessControl.read == false}"> 
        				<c:set var="outletStockIssue" value="true"/> 
                		<div class="col-lg-2 form-group" style="text-align: right;">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="newStockIssueView('stockIssue','outlet');" title="<spring:message code="goodsindent.label" />">
                   			<img src="${pageContext.request.contextPath}/images/OutletStockIssue.png" style="margin-top: 10px;"><br>
                   			<span><spring:message code="goodsindent.label" /></span><br>
                   		</div>
                		</div>
                	</c:if>
                </c:forEach>
                <c:forEach var="accessControl" items="${sessionScope.outletGoodsTransfer}">
       				<c:if test="${accessControl.appSubDocument == 'OutletStockIssue' && outletStockIssue == false}"> 
        				<c:set var="outletStockIssue" value="true"/> 
                		<div class="col-lg-2 form-group" style="text-align: right;">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewAllStockIssues('stockIssue','all','0','outlet');" title="<spring:message code="goodsindent.label" />">
                   			<img src="${pageContext.request.contextPath}/images/OutletStockIssue.png" style="margin-top: 10px;"><br>
                   			<span><spring:message code="goodsindent.label" /></span><br>
                   		</div>
                		</div>
                	</c:if>
                </c:forEach>
                <c:forEach var="accessControl" items="${sessionScope.outletGoodsTransfer}">
	                 <c:if test="${accessControl.appSubDocument == 'OutletStockRequest' && accessControl.read == true}"> 
                		<div class="col-lg-2 form-group" style="text-align: right;">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewStockRequest('outletStockRequest','0','outlet');" title="<spring:message code="outlet.stock.request.label" />">
                   			<img src="${pageContext.request.contextPath}/images/OutletStockRequest.png" style="margin-top: 10px;"><br>
                   			<span><spring:message code="outlet.stock.request.label" /></span><br>
                   		</div>
                		</div>
                    </c:if>
              </c:forEach>
              <c:forEach var="accessControl" items="${sessionScope.outletGoodsTransfer}">
	                 <c:if test="${accessControl.appSubDocument == 'OutletStockReturn' && accessControl.read == true}"> 
                		<div class="col-lg-2 form-group" style="text-align: right;">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewGoodsReturn('outletGoodsReturn','0','','outlet');" title="<spring:message code="goods.return.label" />">
                   			<img src="${pageContext.request.contextPath}/images/OutletStockReturn.png" style="margin-top: 10px;"><br>
                   			<span><spring:message code="goods.return.label" /></span><br>
                   		</div>
                		</div>
                    </c:if>
             </c:forEach>
             
             <c:forEach var="accessControl" items="${sessionScope.outletGoodsTransfer}">
	                  <c:if test="${accessControl.appSubDocument == 'StockReceipt' && accessControl.read == true}"> 
                		<div class="col-lg-2 form-group" style="text-align: right;">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewAllStockReceipts('stockReceipt','all','0','outlet');" title="<spring:message code="goodsreceipts.label" />">
                   			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: 10px;margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                   			<span><spring:message code="goodsreceipts.label" /></span><br>
                   		</div>
                		</div>
                    </c:if>
             </c:forEach>
             
             
             
                    </div>
                  </c:if>
</body>
</html>