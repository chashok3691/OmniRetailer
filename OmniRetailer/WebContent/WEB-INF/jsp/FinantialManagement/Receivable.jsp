<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Harsha
 * file name		        : /OmniRetailer/WebContent/WEB-INF/jsp/FinantialManagement/Receivable.jsp
 * file type		        : JSP
 * description				: This is Receivable, which u get after clicking on Reports menu of Financial Management.
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
        <!-- DATA TABLES -->
        <link href="${pageContext.request.contextPath}/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
           <script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script> 
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/controller.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/procurement/purchaseOrderAndReceipts.js"></script>
        

</head>
<body>
<div style="margin-left: 100px;margin-right: auto;margin-top: 20px;margin-bottom: 50px;border-style: solid;border-width: 1px;border-color: grey;padding-top: 5px;padding-bottom: 10px;padding-left: 20px;color: blue;">
<h3>Supplier wise Profitability</h3>
<p>Understand business spending, where you spend, and how much you earn from each supplier.</p>
</div>
<div style="margin-left: 100px;margin-right: auto;margin-top: 20px;margin-bottom: 50px;border-style: solid;border-width: 1px;border-color: grey;padding-top: 5px;padding-bottom: 10px;padding-left: 20px;color: blue;">
<h3>Supplier wise Purchases</h3>
<p>Get complete picture on supplier wise purchases and compatitive analsys of purchase cost.</p>
</div>
<div style="margin-left: 100px;margin-right: auto;margin-top: 20px;margin-bottom: 50px;border-style: solid;border-width: 1px;border-color: grey;padding-top: 5px;padding-bottom: 10px;padding-left: 20px;color: blue;">
<h3>Supplier wise Payables</h3>
<p>Aging report on paybales.</p>
</div>
</body>
</html>