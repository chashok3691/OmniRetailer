<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sambaiah Y
 * file name		        : onventorymanager/salesreports/salesreports.jsp
 * file type		        : JSP
 * description				: display sales reports information
 * */ -->


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
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewBrandMaster('brandMaster','0');" title="<spring:message code="brand.master.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/BrandMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="brand.master.label" /></span>
			                          		</div>
		                          		</div>

											<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewCategoryMaster('categoryMaster','0');" title="<spring:message code="category.label" />&nbsp;&nbsp;<spring:message code="masters_label" />">
			                          			<img src="${pageContext.request.contextPath}/images/CategoryMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="category.label" /></span>
			                          			<span><spring:message code="masters_label" /></span>
			                          		</div>
		                          		</div> 

											<div class="col-lg-2 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewCurrencyMaster('currencyMaster','0');" title="<spring:message code="currency.label" />&nbsp;&nbsp;<spring:message code="masters_label" />">
			                          			<img src="${pageContext.request.contextPath}/images/CurrencyMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="currency.label" /></span>
			                          			<span><spring:message code="masters_label" /></span>
			                          		</div>
			                          	</div>	

											<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewDenominationMaster('DenominationMaster','0');" title="<spring:message code="denomination.master.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/AssetMaster.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="denomination.master.label" /></span>
		                          		</div>
		                          		</div>
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          		<br><br>
                          		<div class="row">
                          				<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewEmployeeMaster('employeeMaster','0','');" title="<spring:message code="edit.employee.header.label" />&nbsp;&nbsp;<spring:message code="masters_label" />">
			                          			<img src="${pageContext.request.contextPath}/images/EmployeeMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="edit.employee.header.label" /></span>
			                          			<span><spring:message code="masters_label" /></span>
			                          		</div>
		                          		</div>

											<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewLocationMaster('locationMaster','0');" title="<spring:message code="location.label" />&nbsp;&nbsp;<spring:message code="masters_label" />">
			                          			<img src="${pageContext.request.contextPath}/images/LocationMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="location.label" /></span>
			                          			<span><spring:message code="masters_label" /></span>
			                          		</div>
		                          		</div>

											<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewShipmentRateMaster('shipmentRateMaster','0');" title="<spring:message code="shipment.rate.master.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/ShipmentRateMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="shipment.rate.master.label" /></span>
			                          		</div>
		                          		</div>
											<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewSupplierMaster('supplierMaster','0');" title="<spring:message code="Supplier.label" />&nbsp;&nbsp;<spring:message code="masters_label" />">
			                          			<img src="${pageContext.request.contextPath}/images/SupplierMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="Supplier.label" /></span>
			                          			<span><spring:message code="masters_label" /></span>
			                          		</div>
		                          		</div>
                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
                          		</div>
                          		<div class="row">
                          		<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewSubCategoryMaster('subCategoryMaster','0');" title="<spring:message code="subcategory.label" />&nbsp;&nbsp;<spring:message code="masters_label" />">
			                          			<img src="${pageContext.request.contextPath}/images/SubCategoryMater.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="subcategory.label" /></span>
			                          			<span><spring:message code="masters_label" /></span>
			                          		</div>
		                          		</div>
											<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewTaxMaster('taxMaster','0');" title="<spring:message code="tax.master.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/TaxMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="tax.master.label" /></span>
			                          		</div>
		                          		</div> 
											<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewZoneMaster('zoneMaster','0');" title="<spring:message code="zone.master.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/ZoneMater.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="zone.master.label" /></span>
			                          		</div>
		                          		</div>
		                          		
		                          		<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewRouteMaster('routeMaster','0');" title="Route Master">
			                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
			                          			<span>Route master</span>
			                          		</div>
		                          		</div>
		                          		
		                          		<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return  viewServiceAreaMaster('serviceAreaMaster','0');" title="Service Area Master">
			                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
			                          			<span>Service Area Master</span>
			                          		</div>
		                          		</div>
		                          		
		                          		<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return  viewTenderMaster('tenderMaster','0');" title="Tender Master">
			                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
			                          			<span>Tender Master</span>
			                          		</div>
		                          		</div>
		                          		
		                          		
		                          		<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newTenderMaster('newTenderMaster');" title="Department">
			                          			<img src="${pageContext.request.contextPath}/images/ZoneMater.png" style="margin-top: 10px;"><br><br>
			                          			<span>Department</span>
			                          		</div>
		                          		</div>
		                          		
		                          		<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return  viewHSNMaster('hsnMaster','0','');" title="Hsn Master">
			                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
			                          			<span>Hsn Master</span>
			                          		</div>
		                          		</div>
                          		
                          		</div>
                          </c:if>
                          <c:if test="${sessionScope.role != 'super admin'}">
                          <c:set var="counts" value="0" />
                          <div class="row">
                           
                          <%--  <c:set var="brandMaster" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                            		<c:if test="${accessControl.appDocument == 'BrandMaster' && accessControl.write == true && accessControl.read == false}">
                            			<c:set var="brandMaster" value="true"/> 
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newBrandMaster('brandMaster');" title="<spring:message code="brand.master.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/BrandMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="brand.master.label" /></span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'BrandMaster' && brandMaster==false}">
	                            		<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewBrandMaster('brandMaster','0');" title="<spring:message code="brand.master.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/BrandMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="brand.master.label" /></span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
                            </c:forEach> --%>
                            
                            
                            <c:set var="brandMaster" value="false"/>	
                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                            		<c:if test="${accessControl.appDocument == 'BrandMaster' && accessControl.write == true && accessControl.read == false}"> 
                            			<c:set var="brandMaster" value="true"/>		
                             			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newBrandMaster('brandMaster');" title="<spring:message code="brand.master.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/BrandMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="brand.master.label" /></span>
			                          		</div>
		                          		</div>
		                          		</c:if>
                             		<c:if test="${accessControl.appDocument == 'BrandMaster' && brandMaster == false}"> 		
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewBrandMaster('brandMaster','0');" title="<spring:message code="brand.master.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/BrandMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="brand.master.label" /></span>
			                          		</div>
		                          		</div>
		                          	</c:if>
                            </c:forEach>
                            
                              <c:set var="categoryMaster" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                            		<c:if test="${accessControl.appDocument == 'CategoryMaster' && accessControl.write == true && accessControl.read == false}">
                            			<c:set var="categoryMaster" value="true"/> 
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newCategory('newCategory');" title="<spring:message code="category.label" />&nbsp;&nbsp;<spring:message code="masters_label" />">
			                          			<img src="${pageContext.request.contextPath}/images/CategoryMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="category.label" /></span>
			                          			<span><spring:message code="masters_label" /></span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'CategoryMaster' && categoryMaster==false}">
	                            		<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewCategoryMaster('categoryMaster','0');" title="<spring:message code="category.label" />&nbsp;&nbsp;<spring:message code="masters_label" />">
			                          			<img src="${pageContext.request.contextPath}/images/CategoryMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="category.label" /></span>
			                          			<span><spring:message code="masters_label" /></span>
			                          		</div>
		                          		</div> 
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
                            </c:forEach>
                          
                         
                           <c:set var="currencyMaster" value="false"/> 
                             <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                             		<c:if test="${accessControl.appDocument == 'CurrencyMaster' && accessControl.write == true && accessControl.read == false}"> 	
                             		 <c:set var="currencyMaster" value="true"/> 
                             		 	<div class="col-lg-2 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newCurrency('newCurrency');" title="<spring:message code="currency.label" />&nbsp;&nbsp;<spring:message code="masters_label" />">
			                          			<img src="${pageContext.request.contextPath}/images/CurrencyMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="currency.label" /></span>
			                          			<span><spring:message code="masters_label" /></span>
			                          		</div>
			                          	</div>	
			                          	<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'CurrencyMaster' && currencyMaster == false}"> 			
                            			<div class="col-lg-2 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewCurrencyMaster('currencyMaster','0');" title="<spring:message code="currency.label" />&nbsp;&nbsp;<spring:message code="masters_label" />">
			                          			<img src="${pageContext.request.contextPath}/images/CurrencyMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="currency.label" /></span>
			                          			<span><spring:message code="masters_label" /></span>
			                          		</div>
			                          	</div>	
			                          	<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
                            </c:forEach>
                         	<c:set var="denominationMaster" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                            		<c:if test="${accessControl.appDocument == 'DenominationMaster' && accessControl.write == true && accessControl.read == false}">
                            			<c:set var="assetMaster" value="true"/> 
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewDenominationMaster('DenominationMaster','0');" title="<spring:message code="denomination.master.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/AssetMaster.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="denomination.master.label" /></span>
		                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'DenominationMaster' && denominationMaster==false}">
	                            		<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewDenominationMaster('DenominationMaster','0');" title="<spring:message code="denomination.master.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/AssetMaster.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="denomination.master.label" /></span>
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
                            <c:set var="employeeMaster" value="false"/> 			
                             <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                             		<c:if test="${accessControl.appDocument == 'EmployeeMaster' && accessControl.write == true && accessControl.read == false}">
                             			<c:set var="employeeMaster" value="true"/>  		
                             			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewNewEmployee('newEmployee');" title="<spring:message code="edit.employee.header.label" />&nbsp;&nbsp;<spring:message code="masters_label" />">
			                          			<img src="${pageContext.request.contextPath}/images/EmployeeMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="edit.employee.header.label" /></span>
			                          			<span><spring:message code="masters_label" /></span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'EmployeeMaster' && employeeMaster == false}"> 		
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewEmployeeMaster('employeeMaster','0','');" title="<spring:message code="edit.employee.header.label" />&nbsp;&nbsp;<spring:message code="masters_label" />">
			                          			<img src="${pageContext.request.contextPath}/images/EmployeeMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="edit.employee.header.label" /></span>
			                          			<span><spring:message code="masters_label" /></span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
                            </c:forEach>	
                              
	                        <div class="row"></div>
	                        
                           <c:set var="locationMaster" value="false"/>	
                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                            		<c:if test="${accessControl.appDocument == 'LocationMaster' && accessControl.write == true && accessControl.read == false}"> 
                            			<c:set var="locationMaster" value="true"/>
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newLocation('newLocation');" title="<spring:message code="location.label" />&nbsp;&nbsp;<spring:message code="masters_label" />">
			                          			<img src="${pageContext.request.contextPath}/images/LocationMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="location.label" /></span>
			                          			<span><spring:message code="masters_label" /></span>
			                          		</div>
		                          		</div>	
		                          		<c:set var="counts" value="${counts+1}" />		
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'LocationMaster' && locationMaster == false}"> 		
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewLocationMaster('locationMaster','0');" title="<spring:message code="location.label" />&nbsp;&nbsp;<spring:message code="masters_label" />">
			                          			<img src="${pageContext.request.contextPath}/images/LocationMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="location.label" /></span>
			                          			<span><spring:message code="masters_label" /></span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
                            </c:forEach> 
                            
                            
                                  <c:set var="productMaster" value="false"/> 
                             <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                             		<c:if test="${accessControl.appDocument == 'ProductMaster' && accessControl.write == true && accessControl.read == false}"> 	
                             		 <c:set var="productMaster" value="true"/> 
                             		 	<div class="col-lg-2 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewNewProduct('newProduct');" title="<spring:message code="product.label" />&nbsp;&nbsp;<spring:message code="masters_label" />">
			                          			<img src="${pageContext.request.contextPath}/images/ProductMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="product.label" /></span>
			                          			<span><spring:message code="masters_label" /></span>
			                          		</div>
			                          	</div>
			                          	<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'ProductMaster' && productMaster == false}"> 			
                            			<div class="col-lg-2 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewProductMaster('productmaster','0');" title="<spring:message code="product.label" />&nbsp;&nbsp;<spring:message code="masters_label" />">
			                          			<img src="${pageContext.request.contextPath}/images/ProductMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="product.label" /></span>
			                          			<span><spring:message code="masters_label" /></span>
			                          		</div>
			                          	</div>	
			                          	<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
                            </c:forEach>
                             
                            		   <c:set var="shipmentRateMaster" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                            		<c:if test="${accessControl.appDocument == 'ShipmentRateMaster' && accessControl.write == true && accessControl.read == false}">
                            			<c:set var="shipmentRateMaster" value="true"/> 
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newShipmentRateMaster('shipmentRateMaster');" title="<spring:message code="shipment.rate.master.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/ShipmentRateMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="shipment.rate.master.label" /></span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'ShipmentRateMaster' && shipmentRateMaster==false}">
	                            		<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewShipmentRateMaster('shipmentRateMaster','0');" title="<spring:message code="shipment.rate.master.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/ShipmentRateMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="shipment.rate.master.label" /></span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
                            </c:forEach>
                              
                          <c:set var="supplierMaster" value="false"/> 			
                             <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                             		<c:if test="${accessControl.appDocument == 'SupplierMaster' && accessControl.write == true && accessControl.read == false}">
                             			<c:set var="supplierMaster" value="true"/>  		
                             			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewNewSupplier('newSupplier');" title="<spring:message code="Supplier.label" />&nbsp;&nbsp;<spring:message code="masters_label" />">
			                          			<img src="${pageContext.request.contextPath}/images/SupplierMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="Supplier.label" /></span>
			                          			<span><spring:message code="masters_label" /></span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'SupplierMaster' && supplierMaster == false}"> 		
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewSupplierMaster('supplierMaster','0');" title="<spring:message code="Supplier.label" />&nbsp;&nbsp;<spring:message code="masters_label" />">
			                          			<img src="${pageContext.request.contextPath}/images/SupplierMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="Supplier.label" /></span>
			                          			<span><spring:message code="masters_label" /></span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
                            </c:forEach>
	                        
                          		 <c:set var="subCategoryMaster" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                            		<c:if test="${accessControl.appDocument == 'SubcategoryMaster' && accessControl.write == true && accessControl.read == false}">
                            			<c:set var="subCategoryMaster" value="true"/> 
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newSubCategory('newSubCategory');" title="<spring:message code="subcategory.label" />&nbsp;&nbsp;<spring:message code="masters_label" />">
			                          			<img src="${pageContext.request.contextPath}/images/SubCategoryMater.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="subcategory.label" /></span>
			                          			<span><spring:message code="masters_label" /></span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'SubcategoryMaster' && subCategoryMaster==false}">
	                            		<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewSubCategoryMaster('subCategoryMaster','0');" title="<spring:message code="subcategory.label" />&nbsp;&nbsp;<spring:message code="masters_label" />">
			                          			<img src="${pageContext.request.contextPath}/images/SubCategoryMater.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="subcategory.label" /></span>
			                          			<span><spring:message code="masters_label" /></span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	 
                            		</c:if>
                            </c:forEach>
                          	   
	                        
	                        <div class="row"></div>
							
						
                            
                            <c:set var="taxMaster" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
	                            	<c:if test="${accessControl.appDocument == 'TaxMaster' && taxMaster==false}"> 
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewTaxMaster('taxMaster','0');" title="<spring:message code="tax.master.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/TaxMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="tax.master.label" /></span>
			                          		</div>
		                          		</div> 
		                          		</c:if>
                            </c:forEach>
                            
                             <c:set var="zoneMaster" value="false"/>	
                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
	                            	<c:if test="${accessControl.appDocument == 'ZoneMaster' && zoneMaster == false}"> 		
                            		<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewZoneMaster('zoneMaster','0');" title="<spring:message code="zone.master.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/ZoneMater.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="zone.master.label" /></span>
			                          		</div>
		                          		</div>
                            		
                            		</c:if>
                            </c:forEach>
                
                         
	                          <c:set var="routeMaster" value="false"/>
							  <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                            		<c:if test="${accessControl.appDocument == 'RouteMaster' && accessControl.write == true && accessControl.read == false}">
                            			<c:set var="routeMaster" value="true"/> 
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newRoute('newROUTE');" title="Route Master">
			                          			<img src="${pageContext.request.contextPath}/images/ZoneMater.png" style="margin-top: 10px;"><br><br>
			                          			<span>Route master</span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'RouteMaster' && routeMaster == false}">
	                            		<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewRouteMaster('routeMaster','0');" title="Route Master">
			                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
			                          			<span>Route master</span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" /> 
                            		</c:if>
                            </c:forEach>
                             <c:if test="${counts == 5}">
	                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
	                          		
	                          		<br><br>
	                          	<div class="row">
	                        </c:if>
	                         <c:set var="serviceAreaMaster" value="false"/>
	                        <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                            		<c:if test="${accessControl.appDocument == 'ServiceAreaMaster' && accessControl.write == true && accessControl.read == false}">
                            			<c:set var="serviceAreaMaster" value="true"/> 
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newserviceAreaMaster('newServiceAreaMaster');" title="Service Area Master">
			                          			<img src="${pageContext.request.contextPath}/images/ZoneMater.png" style="margin-top: 10px;"><br><br>
			                          			<span>Service Area Master</span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'ServiceAreaMaster' && serviceAreaMaster == false}">
	                            		<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return  viewServiceAreaMaster('serviceAreaMaster','0');" title="Service Area Master">
			                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
			                          			<span>Service Area Master</span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" /> 
                            		</c:if>
                            </c:forEach>
                             <c:if test="${counts == 15}">
	                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
	                          		</div>
	                          		<br><br><br><br>
	                          	<div class="row">
	                        </c:if>
	                        <c:set var="TenderMaster" value="false"/>	
                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                            		<c:if test="${accessControl.appDocument == 'TenderMaster' && accessControl.write == true && accessControl.read == false}"> 
                            			<c:set var="TenderMaster" value="true"/>	
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newTenderMaster('newTenderMaster');" title="Tender Master">
			                          			<img src="${pageContext.request.contextPath}/images/ZoneMater.png" style="margin-top: 10px;"><br><br>
			                          			<span>Tender Master</span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
	                            	<c:if test="${accessControl.appDocument == 'TenderMaster' && TenderMaster == false}"> 		
    	                            		<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return  viewTenderMaster('tenderMaster','0');" title="Tender Master">
			                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
			                          			<span>Tender Master</span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" /> 
                            		</c:if>
                            </c:forEach>
                            <c:if test="${counts == 15}">
	                          		<div class="col-lg-2 form-group" style="text-align: right;"></div>
	                          		</div>
	                          		<br><br>
	                          	<div class="row"></div>
	                        </c:if>
                            
           <div class="row"></div>
                            
                             <c:set var="hsnMaster" value="false"/> 	 
	                          <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                            		<c:if test="${accessControl.appDocument == 'HSNMaster' && accessControl.write == true && accessControl.read == false}">
                            			<c:set var="serviceAreaMaster" value="true"/> 
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newHsnMaster('newHsnMaster');" title="Hsn Master">
			                          			<img src="${pageContext.request.contextPath}/images/ZoneMater.png" style="margin-top: 10px;"><br><br>
			                          			<span>Hsn Master </span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" />	
                            		</c:if>
                            		
	                            	<c:if test="${accessControl.appDocument == 'HSNMaster' && hsnMaster == false}">
	                            		<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return  viewHSNMaster('hsnMaster','0','');" title="Hsn Master">
			                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
			                          			<span>Hsn Master</span>
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
	                      
	                             
                            		 <c:set var="organizationdepartmentMaster" value="false"/> 
                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
	                            	<c:if test="${accessControl.appDocument == 'OrgDepartments' && organizationdepartmentMaster == false}"> 
	                            		<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;"  onclick="return viewOrganizationDepartmentMaster('organizationdepartmentMaster','0');" title="Orgnization Department">
			                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
			                          			<span>Orgnization Department</span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" /> 
                            		</c:if> 
                            </c:forEach> 
                            
                             
                            
                            <c:set var="stateMaster" value="false"/>			
                             <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                             		<c:if test="${accessControl.appDocument == 'StateMaster' && stateMaster == false}">
                             			<c:set var="stateMaster" value="true"/>  
                            			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;"  onclick="return viewStateMaster('stateMaster','0','');" title="State Master">
			                          		<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
			                         			<span>State Master</span>
			                          		</div>
		                          		</div>
		                          	</c:if>
                                  </c:forEach>	
                            
                              <c:set var="departmentMaster" value="false"/> 
                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                                 <c:if test="${accessControl.appDocument == 'Departments' && departmentMaster == false}"> 
	                            		<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;"  onclick="return viewDepartmentMaster('departmentMaster','0');" title="Departments">
			                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
			                          			<span> Departments</span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" /> 
                            		</c:if> 
                            </c:forEach> 
                            
                             <c:set var="B2BPartners" value="false"/>	
                            <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}">
                             		<c:if test="${accessControl.appDocument == 'B2BPartners' && B2BPartners == false}">
	                            		<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;"  onclick="return viewb2bPartners('b2bPartners','0');" title="B2B Partner">
			                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
			                          			<span> B2B Partner</span>
			                          		</div>
		                          		</div>
		                          		<c:set var="counts" value="${counts+1}" /> 
                            		</c:if> 
                            </c:forEach> 
                            
                            
                          	</div>
                         	</c:if>
</body>
</html>