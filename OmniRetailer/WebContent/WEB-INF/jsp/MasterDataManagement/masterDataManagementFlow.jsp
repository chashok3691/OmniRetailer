
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
	                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return showGenericMasterFlows();" title="<spring:message code="generic.data.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/GenericMaster.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="generic.data.label" /></span>
	                          		</div>
	                          	</div>
	                          	<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return showOutletMasterFlows();" title="<spring:message code="masters.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/OutletMaster.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="masters.label" /></span>
	                          		</div>
                          		</div>
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return showWarehouseMasterFlows();" title="<spring:message code="warehouse.master.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/OutletMaster.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="warehouse.master.label" /></span>
	                          		</div>
                          		</div>                        		
                            </div>
                          </c:if>
                          <c:if test="${sessionScope.role != 'super admin'}">
                          <div class="row">
                             <c:forEach var="accessControl" items="${sessionScope.genericBusinessSettings}" varStatus="theCount">
                             		<c:if test="${theCount.count == 1}"> 	
                             		 	<div class="col-lg-2 form-group" style="text-align: right;">
			                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return showGenericMasterFlows();" title="<spring:message code="generic.data.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/GenericMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="generic.data.label" /></span>
			                          		</div>
			                          	</div>
                            		</c:if>
                            </c:forEach>
                             <c:forEach var="accessControl" items="${sessionScope.outletMasterSettings}" varStatus="theCount">
                             		<c:if test="${theCount.count == 1}"> 	
                             			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return showOutletMasterFlows();" title="<spring:message code="masters.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/OutletMaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="masters.label" /></span>
			                          		</div>
		                          		</div>
                            		</c:if>
                            </c:forEach>	
                             <c:forEach var="accessControl" items="${sessionScope.warehouseMasterSettings}" varStatus="theCount">
                             		<c:if test="${theCount.count == 1}"> 	
                             			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return showWarehouseMasterFlows();" title="<spring:message code="warehouse.master.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/warehousemaster.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="warehouse.master.label" /></span>
			                          		</div>
		                          		</div>
                            		</c:if>
                            </c:forEach>                               
                            </div>                            
                         </c:if>  
                                               
								<div style="margin-left: 57px;border: 1px;margin-right: auto;margin-top: 20px;margin-bottom: 50px;border-style: solid;border-width: 1px;border-color: lightgray;padding-top: 15px;padding-bottom: 25px;padding-left: 20px;border-radius: 15px;padding-right: 15px;width: 935px;">								
								<p>We need to configure and upload master data before Business Transactions can happen. Master Data Management allows the Retailer to setup Outlets, Warehouses, Taxation, Denominations and so on. The Master Data Management is organized into three categories.</p>
								<ol>								
								<li>Generic Masters</li>								
								<li>Outlet Masters</li>								
								<li>Warehouse Masters.</li>
								</ol>
								<p>You can enter master data and save using Master Data Management flows. Master data like products/skus can be very huge in size. It may into few millions of records. One can import such huge data in excel format.</p>
								<div class="row">
								<div class="col-lg-2">
								<p><b><u>Generic Masters:</u></b></p>
								</div>
								<div class="col-lg-10">
								<p>Required to setup generic configuration data like Brands, Categories, Business Locations, Denominations, Departments, Taxation, Service Area and Routes, and Shipment Rates.</p>								
								</div>
								</div>
								<div class="row">
								<div class="col-lg-2">
								<p><b><u>Outlet Masters:</u></b></p>
								</div>
								<div class="col-lg-10">
								<p>We need to configure SKUs, BOM for Combo Products, SKU Grouping, SKU pricing from time-to-time. This information is specific to each Retail Location. Omni Retailer Platform
								treats Online as another logical location. TechnoLabs Retail Cloud platform allows the Retailer to configure the data
								specific to each location. For example, Price and Tax can be different for each outlet location.</p>							
								</div>
								</div>
								<div class="row">
								<div class="col-lg-2">
								<p><b><u>Warehouse Masters:</u></b></p>
								</div>
								<div class="col-lg-10">
								<p>Omni Retailer can support one or more Warehouse or Distribution Centers. Warehouse can also be a fullfillment Center for Online Commerce or other
								sales channels. Like Outlets, Warehouse master data includes SKUs, Storage Systems, Fleet Management, and Logistics Partners.</p>							
								</div>
								</div>	
								</div>	
																				                        
</body>
</html>