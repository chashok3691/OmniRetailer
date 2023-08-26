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
	                          			<img src="${pageContext.request.contextPath}/images/ShiftMaster.png" style="margin-top: 10px;"><br><br>
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
                           
                               <c:if test="${flowunder == 'outlet'}">
                          <%-- <c:set var="shiftMaster" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.shiftManagement}">
                            	<c:if test="${accessControl.appDocument == 'ShiftMaster' && accessControl.write == true && accessControl.read == false}"> 
                            		<c:set var="shiftMaster" value="true"/>
                           			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewNewShift('newShift');" title="<spring:message code="shift.master.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/ShiftMaster.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="shift.master.label" /></span>
		                          		</div>
                          			</div>
                            	</c:if>
                            	<c:if test="${accessControl.appDocument == 'ShiftMaster' && shiftMaster == false}"> 		
                           			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewShiftMaster('${flowunder}shiftMaster','0','','${flowunder}');" title="<spring:message code="shift.master.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/ShiftMaster.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="shift.master.label" /></span>
		                          		</div>
                          			</div>
                           		</c:if>
                            </c:forEach>  --%>
                            
                            <c:set var="shiftMaster" value="false"/>
	                            <c:forEach var="accessControl" items="${sessionScope.shiftManagement}">
	                            	<c:if test="${accessControl.appDocument == 'ShiftMaster' && shiftMaster == false}"> 		
                           			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewShiftMaster('${flowunder}shiftMaster','0','','${flowunder}');" title="<spring:message code="shift.master.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/ShiftMaster.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="shift.master.label" /></span>
		                          		</div>
                          			</div>
                           		</c:if>
	                            </c:forEach> 
	                            
	                            <c:set var="shiftConfiguration" value="false"/>
	                             <c:forEach var="accessControl" items="${sessionScope.shiftManagement}">
	                             	
	                            	<c:if test="${accessControl.appDocument == 'ShiftConfiguration' && shiftConfiguration == false}"> 		
                            			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewShiftAllocationMaster('outletshiftConfiguration','0','outlet');" title="<spring:message code="shift.master.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/ShiftMaster.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="shift.master.label" /></span>
		                          		</div>
                          			</div>
                            		 </c:if>
	                            </c:forEach>
                            		
                             <%-- <c:set var="ShiftConfiguration" value="false"/>
                             <c:forEach var="accessControl" items="${sessionScope.shiftManagement}">
                             	<c:if test="${accessControl.appDocument == 'ShiftConfiguration' && accessControl.write == true && accessControl.read == false}"> 
                            		<c:set var="ShiftConfiguration" value="true"/>
                           			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newShiftAllocation('newShiftAllocation');" title="<spring:message code="shift.configuration.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/shiftconfiguration.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="shift.configuration.label" /></span>
		                          		</div>
                          			</div>
                            	</c:if>
                            	<c:if test="${accessControl.appDocument == 'ShiftConfiguration' && ShiftConfiguration == false}"> 		
                           			<div class="col-lg-2">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewShiftAllocationMaster('${flowunder}shiftConfiguration','0','${flowunder}');" title="<spring:message code="shift.configuration.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/shiftconfiguration.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="shift.configuration.label" /></span>
		                          		</div>
		                          	</div>
                           		 </c:if>
                            </c:forEach> --%>
                          </c:if>  
                            
                            
                            
                                <c:if test="${flowunder == 'warehouse'}">
                             <c:set var="shiftMaster" value="false"/>
                            <c:forEach var="accessControl" items="${sessionScope.warehouseshiftManagement}">
                            	<c:if test="${accessControl.appDocument == 'WarehouseShiftMaster' && accessControl.write == true && accessControl.read == false}"> 
                            		<c:set var="shiftMaster" value="true"/>
                           			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewNewShift('newShift');" title="<spring:message code="shift.master.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/ShiftMaster.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="shift.master.label" /></span>
		                          		</div>
                          			</div>
                            	</c:if>
                            	<c:if test="${accessControl.appDocument == 'WarehouseShiftMaster' && shiftMaster == false}"> 		
                           			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return viewShiftMaster('${flowunder}shiftMaster','0','','${flowunder}');" title="<spring:message code="shift.master.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/ShiftMaster.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="shift.master.label" /></span>
		                          		</div>
                          			</div>
                           		</c:if>
                            </c:forEach> 		
                             <c:set var="ShiftConfiguration" value="false"/>
                             <c:forEach var="accessControl" items="${sessionScope.warehouseshiftManagement}">
                             	<c:if test="${accessControl.appDocument == 'WarehouseShiftConfiguration' && accessControl.write == true && accessControl.read == false}"> 
                            		<c:set var="ShiftConfiguration" value="true"/>
                           			<div class="col-lg-2" style="text-align: right;">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="return newShiftAllocation('newShiftAllocation');" title="<spring:message code="shift.configuration.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/shiftconfiguration.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="shift.configuration.label" /></span>
		                          		</div>
                          			</div>
                            	</c:if>
                            	<c:if test="${accessControl.appDocument == 'WarehouseShiftConfiguration' && ShiftConfiguration == false}"> 		
                           			<div class="col-lg-2">
		                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewShiftAllocationMaster('${flowunder}shiftConfiguration','0','${flowunder}');" title="<spring:message code="shift.configuration.label" />">
		                          			<img src="${pageContext.request.contextPath}/images/shiftconfiguration.png" style="margin-top: 10px;"><br><br>
		                          			<span><spring:message code="shift.configuration.label" /></span>
		                          		</div>
		                          	</div>
                           		 </c:if>
                            </c:forEach>
                            </c:if>
                            
                            
                          </div>
</body>
</html>