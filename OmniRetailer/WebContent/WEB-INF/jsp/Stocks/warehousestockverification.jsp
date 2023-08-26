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
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewStockVerification('warehouseStockVerification','0','warehouse','menu','');" title="Verfication Master">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Verfication Master</span>
                          		</div>
                          	</div>
                          	
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewWarehouseStockVerification('warehouseStockVerificationReport','0','warehouse','menu','','');" title="Verfications">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Verfications</span>
                          		</div>
                          	</div>
                          	
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewStockUploading('warehouseStockUploading','0','warehouse','menu','','');" title="Stock Uploading">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Stock Uploading</span>
                          		</div>
                          	</div>
                          	
                          
                          	
                          	<div class="col-lg-2 form-group" style="text-align: left;"></div>
                       </div>
                       <div class="row">
                          	
                          
                       </div>     
                        </c:if>  
                        <c:if test="${sessionScope.role != 'super admin'}">
                         <c:set var="noOfCols" value="0"/>
                          <div class="row">
                          <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
	                        <c:if test="${accessControl.appSubDocument == 'WarehouseStockVerification' && accessControl.read == true}"> 
	                        <c:set var="noOfCols" value="${noOfCols + 1}" />
                          	<div class="col-lg-2 form-group">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewStockVerification('warehouseStockVerification','0','warehouse','menu','');" title="Verfication Master">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Verfication Master</span>
                          		</div>
                          	</div>
                          	</c:if>
                          </c:forEach>
                         
                        
                        <c:if test="${noOfCols == 5}">
                          			<div class="col-lg-2 form-group" style="text-align: left;"></div>
                          		</div>
	                        	<div class="row">
		                    </c:if>
                        <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
	                       <c:if test="${accessControl.appSubDocument == 'WarehouseStockVerification' && accessControl.read == true}"> 
	                       <c:set var="noOfCols" value="${noOfCols + 1}" />
                          	<div class="col-lg-2 form-group" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewWarehouseStockVerification('warehouseStockVerificationReport','0','warehouse','menu','','');" title="Verfications">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Verfications</span>
                          		</div>
                          	</div>
                          </c:if>
                       </c:forEach>
                          <c:if test="${noOfCols == 5}">
                          			<div class="col-lg-2 form-group" style="text-align: left;"></div>
                          		</div>
	                        	<div class="row">
		                    </c:if>
                        <c:forEach var="accessControl" items="${sessionScope.warehouseStockmanagement}">
	                      <c:if test="${accessControl.appSubDocument == 'WarehouseStocksUpload' && accessControl.read == true}"> 
	                      <c:set var="noOfCols" value="${noOfCols + 1}" />
                          	<div class="col-lg-2 form-group" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewStockUploading('warehouseStockUploading','0','warehouse','menu','','');" title="Stock Uploading">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Stock Uploading</span>
                          		</div>
                          	</div>
                          </c:if>
                        </c:forEach>
                          	</div>     
                        </c:if>  
                    
                          
</body>
</html>