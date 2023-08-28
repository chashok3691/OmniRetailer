<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Sahitya
 * file name		        : jsp/outletDashboard.jsp
 * file type		        : JSP
 * description				: display outlet reports information
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
				<section class="content-header">
                    <h1>
                      <spring:message code="dashboard.label"/>
                    </h1>
                    <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i><spring:message code="home.label" /></a></li>
                    </ol>
                </section>
                
                         <br/>
                          <div class="row">
                          	<div class="col-lg-2" style="text-align: right;">
                          		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="showOutletDashboard('','','');" title="<spring:message code="outlet_management.reports.label" />">
                          			<img src="${pageContext.request.contextPath}/images/outlet-dashboard.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="outlet.label" /></span>
                          		</div>
                          	</div>
                          	<div class="col-lg-2" style="text-align: right;">
                          	 <div style="text-align: center;width: 140px;height: 130px;margin-left: 57px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="" title="<spring:message code="warehouse_management.reports.label" />">
                          			<img src="${pageContext.request.contextPath}/images/warehouse-dashboard.png" style="margin-top: 10px;"><br><br>
                          			<span><spring:message code="warehouse.label" /></span>
                              </div>
                          	 </div>
                          </div>
                          
                          <br/>
                          
                        
                          
                          <!-- <h3><a href="../pdf/generateInvoice" target="_blank" class="button">Download Invoice PDF Document</a></h3> -->
                         <section class="content">
                         <div class="buttons" style="margin-bottom: 7px;margin-left:5px;">
					   		<a href="../pdf/purchaseorder.pdf" target="_blank" class="button"><font size="2px">Download PDF Document</font></a>
					     </div>
					     </section>
</body>
</html>