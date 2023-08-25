<!--/*
 * Project Name 	        : OmniRetailerCustomer
 * Written By		        : Mythri.S
 * file name		        : Inventory Manager/Deals and Offers/dealsFlow.jsp.jsp
 * file type		        : JSP
 * description				: display deals and offers flows information
 * */ -->


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
                   <div class="row">
                   	<div class="col-lg-2" >
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px; margin-bottom:10px; border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewOrganizationMaster('OrganizationMaster','clear','','');" title="<spring:message code="Accounting.configuration.Organisation" />">
                   			<img src="${pageContext.request.contextPath}/images/NewUser.png" style="margin-top: 10px;"><br><br>
                   			<spring:message code="Accounting.configuration.Organisation" />
                   		</div>
                   	</div>
                   	
                   	<div class="col-lg-2" >
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px; margin-bottom:10px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="accountingAssets('Assets','clear','','');" title="<spring:message code="Accounting.menu.Assets" />">
                   			<img src="${pageContext.request.contextPath}/images/NewUser.png" style="margin-top: 10px;"><br><br>
                   			<spring:message code="Accounting.menu.Assets" />
                   		</div>
                   	</div>
                   	
                   	<div class="col-lg-2">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px; margin-bottom:10px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="accountingLiabilities('liabilities','clear','','');" title="<spring:message code="Accounting.menu.Liabilities" />">
                   			<img src="${pageContext.request.contextPath}/images/EditUser.png" style="margin-top: 10px;"><br><br>
                   			<spring:message code="Accounting.menu.Liabilities" />
                   		</div>
                   	</div>
                   	
                   	<div class="col-lg-2">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px; margin-bottom:10px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="accountingIncome('income','clear','','');" title="<spring:message code="Accounting.menu.Income" />">
                   			<img src="${pageContext.request.contextPath}/images/DeleteUser.png" style="margin-top: 10px;"><br><br>
                   			<spring:message code="Accounting.menu.Income" />
                   		</div>
                   	</div>
                   	
                   	<div class="col-lg-2">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px; margin-bottom:10px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="accountingExpenses('expenses','clear','','');" title="<spring:message code="Accounting.menu.Expenses" />">
                   			<img src="${pageContext.request.contextPath}/images/DeleteUser.png" style="margin-top: 10px;"><br><br>
                   			<spring:message code="Accounting.menu.Expenses" />
                   		</div>
                   	</div>
                   	
                   		<%-- <div class="col-lg-2">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px; margin-bottom:10px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewcustomerRetention('','equity','','');" title="<spring:message code="Equity.label" />">
                   			<img src="${pageContext.request.contextPath}/images/DeleteUser.png" style="margin-top: 10px;"><br><br>
                   			<spring:message code="Equity.label" />
                   		</div>
                   	</div> --%>
                   	</div>
                   	<div class="row">
                   	
                   	<div class="col-lg-2">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px; margin-bottom:10px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="viewcustomerRetention('','equity','','');" title="<spring:message code="Equity.label" />">
                   			<img src="${pageContext.request.contextPath}/images/DeleteUser.png" style="margin-top: 10px;"><br><br>
                   			<spring:message code="Equity.label" />
                   		</div>
                   	</div>
                   	
                   		<div class="col-lg-2">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px; margin-bottom:10px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="accountingReconciliationSummary('clear','reconciliation','0')" title="<spring:message code="Reconciliation.label" />">
                   			<img src="${pageContext.request.contextPath}/images/DeleteUser.png" style="margin-top: 10px;"><br><br>
                   			<spring:message code="Reconciliation.label" />
                   		</div>
                   	</div>
                   	
                   	
                   		<div class="col-lg-2">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px; margin-bottom:10px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="accountingjournal('View','journal','');" title="<spring:message code="Accounting.menu.journal" />">
                   			<img src="${pageContext.request.contextPath}/images/DeleteUser.png" style="margin-top: 10px;"><br><br>
                   			<spring:message code="Accounting.menu.journal" />
                   		</div>
                   	</div>
                   	
                   	<div class="col-lg-2">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px; margin-bottom:10px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="creditNoteSummary('clear','creditNote','');" title="<spring:message code="credit.note.label" />">
                   			<img src="${pageContext.request.contextPath}/images/DeleteUser.png" style="margin-top: 10px;"><br><br>
                   			<spring:message code="credit.note.label" />
                   		</div>
                   	</div>
                   	
                   	<div class="col-lg-2">
                   		<div style="text-align: center;width: 140px;height: 130px;margin-left: 57px; margin-bottom:10px;border: 1px solid #CCCCCC;cursor: pointer;" onclick="accountingDebitNoteSummary('clear','debitNote','');" title="<spring:message code="debite.note.label" />">
                   			<img src="${pageContext.request.contextPath}/images/DeleteUser.png" style="margin-top: 10px;"><br><br>
                   			<spring:message code="debite.note.label" />
                   		</div>
                   	</div>
                   	
                   	
                   	</div>        
                        
                    
                          
</body>
</html>