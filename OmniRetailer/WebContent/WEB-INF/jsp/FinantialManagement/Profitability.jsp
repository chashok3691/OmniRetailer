<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Harsha
 * file name		        : /OmniRetailer/WebContent/WEB-INF/jsp/FinantialManagement/Profitability.jsp
 * file type		        : JSP
 * description				: This is Profitability, which u get after clicking on Reports menu of Financial Management.
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/FinantialManagement/orginizationMaster.js"></script>
        

</head>
<body>
<div style="margin-left: 100px;margin-right: auto;margin-top: 20px;margin-bottom: 50px;border-style: solid;border-width: 1px;border-color: grey;padding-top: 5px;padding-bottom: 10px;padding-left: 20px;color: blue;" onclick="viewProfitAndLoss()">
<h3>Profit & Loss (Income Statement)</h3>
<p>Summary of your revenue and expenses that determine the profit you made.</p>
</div>

<div style="margin-left: 100px;margin-right: auto;margin-top: 20px;margin-bottom: 50px;border-style: solid;border-width: 1px;border-color: grey;padding-top: 5px;padding-bottom: 10px;padding-left: 20px;color: blue;" onclick ="viewBalanceSheet()">
<h3>Balance Sheet</h3>
<p>Snapshot of what your business owns or is due to receive from others (assets), what it owes to others (liabilities), and what you've invested or retained in your company (equity).</p>
</div>
<div style="margin-left: 100px;margin-right: auto;margin-top: 20px;margin-bottom: 50px;border-style: solid;border-width: 1px;border-color: grey;padding-top: 5px;padding-bottom: 10px;padding-left: 20px;color: blue;" onclick ="viewTrialBalance()">
<h3>Trial Balance</h3>
<p>Snapshot of what your business owns or is due to receive from others (assets), what it owes to others (liabilities), and what you've invested or retained in your company (equity).</p>
</div>
<div style="margin-left: 100px;margin-right: auto;margin-top: 20px;margin-bottom: 50px;border-style: solid;border-width: 1px;border-color: grey;padding-top: 5px;padding-bottom: 10px;padding-left: 20px;color: blue;">
<h3>Cash Book</h3>
<p>Cash coming in and going out of your business. Includes items not included in Profit & Loss such as repayment of loan principal and owner drawings (paying yourself).</p>
</div>
</body>
</html>