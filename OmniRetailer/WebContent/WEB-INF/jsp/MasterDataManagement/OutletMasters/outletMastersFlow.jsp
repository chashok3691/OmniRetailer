
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
       
    </head>
<body>
                            <br/>
                          <c:if test="${sessionScope.role == 'super admin'}">
                          <div class="row">
                       <div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewSkuMaster('skumaster','0');" title="<spring:message code="sku.label" />&nbsp;&nbsp;<spring:message code="masters_label" />">
			                          			<img src="${pageContext.request.contextPath}/images/SkuMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="sku.label" /></span>
			                          			<span><spring:message code="masters_label" /></span>
			                          		</div>
		                          		</div>
											<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewProductGroupMaster('productGroupMaster','0');" title="<spring:message code="product.group.master.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/ProductGroupMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="product.group.master.label" /></span>
			                          		</div>
		                          		</div>

										<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewpriceRangeMaster('priceRangeMaster','0');" title="<spring:message code="price.range.master.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/pricerangeMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="price.range.master.label" /></span>
			                          		</div>
		                          		</div>

											<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewBomMaster('BomMaster','0');" title="<spring:message code="bom.master.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/bomMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="bom.master.label" /></span>
			                          		</div>
		                          		</div>
											<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewPriceUpdate('PriceUpdate','0');" title="<spring:message code="price.updating.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/PriceUpdate.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="price.updating.label" /></span>
			                          		</div>
		                          		</div>
	                          		
                          		</div>
                          </c:if>
                          <c:if test="${sessionScope.role != 'super admin'}">
                          <c:set var="counts" value="0" />
                          <div class="row">
                     	
                            <c:set var="skuMaster" value="false"/>	
                            <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}">
                            		<c:if test="${accessControl.appDocument == 'SkuMaster' && accessControl.write == true && accessControl.read == false}"> 
                            			<c:set var="skuMaster" value="true"/>
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newSku('newSku');" title="<spring:message code="sku.label" />&nbsp;&nbsp;<spring:message code="masters_label" />">
			                          			<img src="${pageContext.request.contextPath}/images/SkuMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="sku.label" /></span>
			                          			<span><spring:message code="masters_label" /></span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />		
                            		</c:if>
	                            		<c:if test="${accessControl.appDocument == 'SkuMaster' && skuMaster==false}"> 	
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewSkuMaster('skumaster','0');" title="<spring:message code="sku.label" />&nbsp;&nbsp;<spring:message code="masters_label" />">
			                          			<img src="${pageContext.request.contextPath}/images/SkuMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="sku.label" /></span>
			                          			<span><spring:message code="masters_label" /></span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
                            </c:forEach>
                         
                            <c:if test="${counts == 5}">
	                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
	                          		</div>
	                          		<br><br>
	                          	<div class="row">
	                        </c:if>
                            <c:set var="productGroupMaster" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}">
                            		<c:if test="${accessControl.appDocument == 'ProductGroupMaster' && accessControl.write == true && accessControl.read == false}">
                            			<c:set var="productGroupMaster" value="true"/> 
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newProductGroupMaster('productGroupMaster');" title="<spring:message code="product.group.master.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/ProductGroupMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="product.group.master.label" /></span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'ProductGroupMaster' && productGroupMaster==false}">
	                            		<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewProductGroupMaster('productGroupMaster','0');" title="<spring:message code="product.group.master.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/ProductGroupMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="product.group.master.label" /></span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
                            </c:forEach>
                                <c:set var="priceRangeMaster" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}">
                            		<c:if test="${accessControl.appDocument == 'PriceRangeMaster' && accessControl.write == true && accessControl.read == false}">
                            			<c:set var="priceRangeMaster" value="true"/> 
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newPriceRangeMaster(priceRangeMaster);" title="<spring:message code="price.range.master.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/pricerangeMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="price.range.master.label" /></span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'PriceRangeMaster' && priceRangeMaster==false}">
	                            		<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewpriceRangeMaster('priceRangeMaster','0');" title="<spring:message code="price.range.master.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/pricerangeMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="price.range.master.label" /></span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
                            </c:forEach>
                                <c:set var="BomMaster" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}">
                            		<c:if test="${accessControl.appDocument == 'BOMMaster' && accessControl.write == true && accessControl.read == false}">
                            			<c:set var="BomMaster" value="true"/> 
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newBomMaster('BomMaster');" title="<spring:message code="bom.master.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/bomMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="bom.master.label" /></span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
                            			<c:if test="${accessControl.appDocument == 'BOMMaster' && BomMaster==false}"> 
	                            
	                            		<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewBomMaster('BomMaster','0');" title="<spring:message code="bom.master.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/bomMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="bom.master.label" /></span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
                            </c:forEach>
                            
                            <c:forEach var="accessControl" items="${sessionScope.priceManagement}" varStatus="thCount">
	                            		<c:if test="${thCount.count == 1}"> 
		                  				<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;"  onclick="showpricemgmtflows('outlet');" title="stock update">
			                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
			                          			<span>Price Management</span>
			                          		</div>
		                          		</div>
                            			</c:if>
                            		</c:forEach>
                            <div class="row"></div>
                            
                    <c:set var="OutletStockUpdate" value="false"/>
                             <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}">
                            		<c:if test="${accessControl.appDocument == 'StockUpdate' && accessControl.write == true && accessControl.read == false}">
                            			<c:set var="Stockupdate" value="true"/> 
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newBomMaster('BomMaster');" title="stock update">
			                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
			                          			<span>Stock Update</span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'StockUpdate' && OutletStockUpdate == false}">
	                            		<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick=" viewOutletStockUpdateDetails('OutletStockUpdate','0','');" title="stock update">
			                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
			                          			<span>Stock Update</span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
                            </c:forEach>
                            
                             <c:set var="PriceUpdate" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}">
                            		<c:if test="${accessControl.appDocument == 'PriceUpdate' && accessControl.write == true && accessControl.read == false}">
                            			<c:set var="PriceUpdate" value="true"/> 
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newPriceUpdate('PriceUpdate');" title="<spring:message code="price.updating.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/PriceUpdate.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="price.updating.label" /></span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'PriceUpdate' && PriceUpdate==false}">
	                            		<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewPriceUpdate('PriceUpdate','0');" title="<spring:message code="price.updating.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/PriceUpdate.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="price.updating.label" /></span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
                            </c:forEach>
                            <c:if test="${counts == 5}">
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          		<br><br>
                          	<div class="row">
                         </c:if>
                         
                            <c:if test="${counts > 5}">
		                          	</div>
		                     </c:if>
                            
                         </c:if>
</body>
</html>