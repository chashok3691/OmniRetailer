<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : Admin/genericdata/shiftManagementFlows
 * file type		        : JSP
 * description				: display shift management flows information
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
				<%-- <section class="content-header">
                   <h1><spring:message code="masters.label" />
                    <small><spring:message code="shift.master.label" /></small>
                   </h1>
                   <ol class="breadcrumb">
                    <li><a style="cursor: pointer;" onclick="return viewDashboard('inventorymanager');"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                        <li class="active"><spring:message code="shift.management.label"/></li>
                   </ol>
                </section> --%>
                
                          <br>
                          <div class="row">
                           <c:if test="${sessionScope.role == 'super admin'}"> 
                           		<div class="col-lg-2" style="text-align: right;">
	                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewShiftMaster('shiftMaster','0','');" title="<spring:message code="shift.master.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/PriceUpdate.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="shift.master.label" /></span>
	                          		</div>
                         		</div>
                         		<div class="col-lg-2">
	                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewShiftAllocationMaster('${flowunder}shiftConfiguration','0','${flowUnder}');" title="<spring:message code="shift.configuration.label" />">
	                          			<img src="${pageContext.request.contextPath}/images/shiftconfiguration.png" style="margin-top: 10px;"><br><br>
	                          			<span><spring:message code="shift.configuration.label" /></span>
	                          		</div>
	                          	</div>
                           </c:if>
                           
                             
                         <c:set var="PriceUpdate" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.priceManagement}">
                            	
                            	 	<c:if test="${accessControl.appSubDocument == 'PriceUpdate' && PriceUpdate==false}"> 		
                           			<div class="col-lg-2 form-group" style="text-align: right;">
		                          			<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewPriceUpdate('PriceUpdate','0','priceoutletLocation');" title="<spring:message code="price.updating.label" />">
			                          			<img src="${pageContext.request.contextPath}/images/PriceUpdate.png" style="margin-top: 10px;"><br><br>
			                          			<span><spring:message code="price.updating.label" /></span>
			                          		</div>
		                          		</div>
                           		</c:if>
                            </c:forEach> 		
                             <c:set var="BulkPriceUpdate" value="false"/>
                             <c:forEach var="accessControl" items="${sessionScope.priceManagement}">
                            		<c:if test="${accessControl.appSubDocument == 'BulkPriceUpdate' && BulkPriceUpdate==false}"> 		
                           			<div class="col-lg-2">
		                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewBulkPriceUpdate('BulkPriceUpdate','0','outletLocation');" title="<spring:message code="bulkPrice.update.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
		                          			<span><spring:message code="bulkPrice.update.label" /></span>
		                          		</div>
		                          	</div>
                           		 </c:if>
                            </c:forEach>
                          
                           
                            
                          </div>
</body>
</html>