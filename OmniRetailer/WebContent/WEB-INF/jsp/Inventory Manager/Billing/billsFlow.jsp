<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri.S
 * file name		        : onventorymanager/retailoutlets/outletmanagement.jsp
 * file type		        : JSP
 * description				: display warehouse flows information
 * */ -->


<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> --%>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
     <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
        <title>Welcome | Omni Retailer</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
       
    </head>
<body>
                            <br>
                          <div class="row">
                          	<div class="col-lg-2 form-group" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewBills('outletBilling','0','menu','${flowLocation}')" title="<spring:message code="all.bills.label" /> <spring:message code="bills.label" />">
                          			<img src="${pageContext.request.contextPath}/images/BillAll.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="all.bills.label" /> <spring:message code="bills.label" /></span>
                          		</div>
                          	</div>
                          		<div class="col-lg-2 form-group">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewBills('openBills','0','menu','${flowLocation}')" title="<spring:message code="credit.label" /> <spring:message code="bills.label" />">
                          			<img src="${pageContext.request.contextPath}/images/credit.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="credit.label" /> <spring:message code="bills.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2 form-group">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewBills('pendingBills','0','menu','${flowLocation}')" title="<spring:message code="all.pending.bills.label" />">
                          			<img src="${pageContext.request.contextPath}/images/Pending.jpg" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="all.pending.bills.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2 form-group" style="text-align: left;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewBills('cancelledBills','0','menu','${flowLocation}')" title="<spring:message code="all.canceled.bills.label" />">
                          			<img src="${pageContext.request.contextPath}/images/CancelledBill.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="all.canceled.bills.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2 form-group" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewBills('ReturnedBills','0','menu','${flowLocation}')" title="<spring:message code="all.returned.bills.label" />">
                          			<img src="${pageContext.request.contextPath}/images/ReturnedBill.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="all.returned.bills.label" /></span>
                          		</div>
                          	</div>
                          
                          
                          	<div class="col-lg-2 form-group" style="text-align: left;">
                          	
                          	</div>
                          
                          </div>
                          <br>
                          <br>
                        <div class="row">
                        
                        <div class="col-lg-2 form-group" style="text-align: right;">
                           <div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewBills('voidBills','0','menu','${flowLocation}')" title="<spring:message code="all.void.bills.label" />">
                         	<img src="${pageContext.request.contextPath}/images/imagentavl.png;" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                            <span><spring:message code="all.void.bills.label" /></span>
                           </div>
                        </div>
                        
                        	<div class="col-lg-2 form-group" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewBills('exchengedBills','0','menu','${flowLocation}')" title="<spring:message code="all.exchanged.bills.label" />">
                          			<img src="${pageContext.request.contextPath}/images/ExchangedBill.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="all.exchanged.bills.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2 form-group" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewBills('completedBills','0','menu','${flowLocation}')" title="<spring:message code="all.completed.bills.label" />">
                          			<img src="${pageContext.request.contextPath}/images/CompletedBills.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="all.completed.bills.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2 form-group" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewBills('homeDeliveryBills','0','menu','${flowLocation}')" title="<spring:message code="home.delivery.bills.label" />">
                          			<img src="${pageContext.request.contextPath}/images/HomeDeliveryBills.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="home.delivery.bills.label" /></span>
                          		</div>
                          	</div>
                          	
                          		<div class="col-lg-2 form-group" style="text-align: right;">
                          		<div style="text-align: center;width: 120px;height: 120px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewMCNBills('mcnBillsWarehouse','0','menu','false','warehouse');" title="Mcn">
                          			<img src="${pageContext.request.contextPath}/images/imagentavl.png" style="margin-top: -30px; padding: 34px 12px 0px 59px; margin-left: -33%;"><br><br>
                          			<span>Mcn</span>
                          		</div>
                          	</div>
                          	</div>       
                        
                    
                          
</body>
</html>